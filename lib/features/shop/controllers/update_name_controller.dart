import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lhstore/data/user/user_authentication.dart';
import 'package:lhstore/features/personlization/controllers/user_controller.dart';
import 'package:lhstore/features/shop/screens/profile/profile_update/profile.dart';
import 'package:lhstore/navigation_menu.dart';
import 'package:lhstore/utils/helpers/customSnakbar.dart';
import 'package:lhstore/utils/helpers/full_screen_loader.dart';
import 'package:lhstore/utils/helpers/network_manager.dart';

class UpdateNameController extends GetxController{
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final LastName = TextEditingController();
  final phoneNumber = TextEditingController();
  final UserName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
    final address = TextEditingController();

  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();
  @override
  void onInit(){
    initializeNames();
    super.onInit();
  }
  
  Future<void> initializeNames() async{
    firstName.text = userController.user.value.firstName;
    LastName.text = userController.user.value.lastName;
    phoneNumber.text = userController.user.value.phoneNumber;
    UserName.text = userController.user.value.userName;
    address.text = userController.user.value.address;
  }

  Future<void> updateUserName() async{
    try{
      LHFullScreenLoader.openLoadingDialog('We are updating your Information...', 'assets/json/loading.json');

      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        LHFullScreenLoader.stopLoading();
        return;
      }

      if(!updateUserNameFormKey.currentState!.validate()){
        LHFullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> name = {'FirstName': firstName.text.trim(), 'LastName': LastName.text.trim(), 'PhoneNumber': phoneNumber.text.trim(), 'UserName': UserName.text.trim()};
      await userRepository.updateSingleField(name);

      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = LastName.text.trim();
      userController.user.value.phoneNumber = phoneNumber.text.trim();
      userController.user.value.userName = UserName.text.trim();
      userController.user.value.address = address.text.trim();

      LHFullScreenLoader.stopLoading();

      LHLoader.successSnackBar(title: 'Congratulations', message: 'Your Name has been Updated');

      Get.off(() => ProfileUpdate());
    } catch(e){
      LHFullScreenLoader.stopLoading();
      LHLoader.ErrorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<void> updateAddress() async{
    try{
      LHFullScreenLoader.openLoadingDialog('We are updating your Information...', 'assets/json/loading.json');

      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        LHFullScreenLoader.stopLoading();
        return;
      }

      if(!updateUserNameFormKey.currentState!.validate()){
        LHFullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> name = {'PhoneNumber': phoneNumber.text.trim(), 'Address': address.text.trim()};
      await userRepository.updateSingleField(name);
      
      userController.user.value.phoneNumber = phoneNumber.text.trim();
      userController.user.value.address = address.text.trim();

      LHFullScreenLoader.stopLoading();

      LHLoader.successSnackBar(title: 'Congratulations', message: 'Your Address has been Updated');

      Get.off(() => NavigationMenu());
    } catch(e){
      LHFullScreenLoader.stopLoading();
      LHLoader.ErrorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}