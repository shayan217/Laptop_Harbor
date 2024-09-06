import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lhstore/data/repositories_authentication/authentication_repository.dart';
import 'package:lhstore/features/authentication/screens/password_configration/reset_password_screen.dart';
import 'package:lhstore/utils/helpers/customSnakbar.dart';
import 'package:lhstore/utils/helpers/full_screen_loader.dart';
import 'package:lhstore/utils/helpers/network_manager.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
      LHFullScreenLoader.openLoadingDialog('Processing your request...', 'assets/json/forgetpassword.json');

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {LHFullScreenLoader.stopLoading(); return;}

      //form validation
      if(!forgetPasswordFormKey.currentState!.validate()) {
        LHFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      LHFullScreenLoader.stopLoading();

      LHLoader.successSnackBar(title: 'Email Sent', message: 'Email Link Sent To Reset your Password'.tr);

      Get.to(() => ResetPassword(email: email.text.trim()));

    } catch (e) {
      LHFullScreenLoader.stopLoading();
      LHLoader.ErrorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      LHFullScreenLoader.openLoadingDialog('Processing your request...', 'assets/json/forgetpassword.json');

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {LHFullScreenLoader.stopLoading(); return;}

      //form validation


      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      LHFullScreenLoader.stopLoading();

      LHLoader.successSnackBar(title: 'Email Sent', message: 'Email Link Sent To Reset your Password'.tr);



    } catch (e) {
      LHFullScreenLoader.stopLoading();
      LHLoader.ErrorSnackBar(title: 'Oh Snap', message: e.toString());
    } 
  }
}