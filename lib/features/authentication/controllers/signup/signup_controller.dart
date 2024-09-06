import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lhstore/data/repositories_authentication/authentication_repository.dart';
import 'package:lhstore/data/user/user_authentication.dart';
import 'package:lhstore/features/authentication/models/userModel.dart';
import 'package:lhstore/features/authentication/screens/signup/verify_email.dart';
import 'package:lhstore/utils/constants/image_strings.dart';
import 'package:lhstore/utils/helpers/customSnakbar.dart';
import 'package:lhstore/utils/helpers/full_screen_loader.dart';
import 'package:lhstore/utils/helpers/network_manager.dart';

class SignupController extends GetxController{
  static SignupController get instance => Get.find();

  // Variables//
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();


  // Sign up//
  void signup() async {
    try{
      // start loading//
      LHFullScreenLoader.openLoadingDialog("We are processing your information....", LHImages.darkAppLogo);

      // Check internet  connect//
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        LHFullScreenLoader.stopLoading();
        return;
      };
      // form Validation//
      if(!signupFormKey.currentState!.validate()){
        LHFullScreenLoader.stopLoading();
        return;
      };
      // pravicy policy//
      if(!privacyPolicy.value){
        LHLoader.WarningSnackBar(title: "Accept Privacy Policy",
        message: 'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use'
        );
      LHFullScreenLoader.stopLoading();
        return;
      }
      // Register user in the firbase authentication & save user data in the firebase//
      final UserCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());
      // Save Authentication  user data in the firebase firestore//
      final newUser = UserModel(
        id: UserCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
        address: '',
      );
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      LHFullScreenLoader.stopLoading();
      // show success message//
      LHLoader.successSnackBar(title: "Congratulations", message: "Your has been created: Verify Email to continue");
      // Move to  Verify email screen//
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    }catch (e){
      LHFullScreenLoader.stopLoading();
      LHLoader.ErrorSnackBar(title: 'Oh Sanp', message: e.toString());
    }
  }
}