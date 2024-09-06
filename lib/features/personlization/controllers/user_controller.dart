
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lhstore/data/repositories_authentication/authentication_repository.dart';
import 'package:lhstore/data/user/user_authentication.dart';
import 'package:lhstore/features/authentication/models/userModel.dart';
import 'package:lhstore/features/authentication/screens/login/login.dart';
import 'package:lhstore/features/shop/screens/reAuth/re_auth.dart';
import 'package:lhstore/utils/constants/sizes.dart';
import 'package:lhstore/utils/helpers/customSnakbar.dart';
import 'package:lhstore/utils/helpers/full_screen_loader.dart';
import 'package:lhstore/utils/helpers/network_manager.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  
  final hidePassword =  false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit(){
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async{
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e){
      user(UserModel.empty());
    }finally{
      profileLoading.value = false;
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try{
      //refresh user Record//
      await fetchUserRecord();
      if(user.value.id.isEmpty){
       
        if(userCredentials != null){

          final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? '');
          final username = UserModel.generateUserName(userCredentials.user!.displayName ?? '');

        final user = UserModel(
          id: userCredentials.user!.uid, 
          firstName: nameParts[0], 
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '', 
          userName: username, 
          email: userCredentials.user!.email ?? '', 
          phoneNumber: userCredentials.user!.phoneNumber ?? '', 
          profilePicture: userCredentials.user!.photoURL ?? '',
          address: userCredentials.user!.toString() ?? '',
          
          );

          await userRepository.saveUserRecord(user);
        }
      }
    }catch (e) {
      LHLoader.WarningSnackBar(
        title: 'Data not saved',
        message: 'Something went wrong while saving your infromation, You can re-save your data in your Profile',
      );
    }
  }

  void deleteAccountWarningPopup(){
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(LHSize.md),
      title: 'Delete Account',
      middleText: 'Are you sure you want to delete account permanently? This action is not reversible and of all your data will be removed permanently.',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red, side: BorderSide(color: Colors.red)),
        child: Padding(padding: EdgeInsets.symmetric(horizontal: LHSize.lg), child: Text('Delete'),),
      ),
      cancel: OutlinedButton(
        child: Text('Cancal'),
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
      )
    );
  }

  void deleteUserAccount() async {
    try{
      LHFullScreenLoader.openLoadingDialog('Processing', 'assets/json/loading.json');
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        if(provider == 'google.com'){
          await auth.signInwithGoogle();
          await auth.deleteAccount();
          LHFullScreenLoader.stopLoading();
          Get.offAll(() => LoginScreen());
        }else if(provider ==  'password'){
           LHFullScreenLoader.stopLoading();
           Get.to(() => ReAuthLoginForm());
        }
      }
    }catch(e){
      LHFullScreenLoader.stopLoading();
      LHLoader.WarningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<void> reAuthenticateEmailAndPasswordUser() async{
    try{
      LHFullScreenLoader.openLoadingDialog('Processing', 'assets/json/loading.json');

      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        LHFullScreenLoader.stopLoading();
        return;
      }

      if(!reAuthFormKey.currentState!.validate()){
        LHFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      LHFullScreenLoader.stopLoading();
      Get.offAll(() => LoginScreen());
    }catch(e){
      LHFullScreenLoader.stopLoading();
      LHLoader.WarningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  uploadUserProfilePicture() async{
    try{
final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70, maxHeight: 512, maxWidth: 512);
    if(image != null){
      imageUploading.value = true;
      final imageUrl = await userRepository.uploadImage('Users/Images/Profile', image);
      Map<String, dynamic> json = {'ProfilePicture': imageUrl};
      await userRepository.updateSingleField(json);

      user.value.profilePicture = imageUrl;
      user.refresh();
      LHLoader.successSnackBar(title: 'Congratulations', message: 'Your Profile Image has been updated');
    }
    } catch (e){
        LHLoader.ErrorSnackBar(title: 'Oh Snap', message: 'Something went Wrong : $e');
    }
    finally{
      imageUploading.value = false;
    }
}
}