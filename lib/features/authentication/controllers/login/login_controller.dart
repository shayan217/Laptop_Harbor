import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lhstore/data/repositories_authentication/authentication_repository.dart';
import 'package:lhstore/features/personlization/controllers/user_controller.dart';
import 'package:lhstore/utils/constants/image_strings.dart';
import 'package:lhstore/utils/helpers/customSnakbar.dart';
import 'package:lhstore/utils/helpers/full_screen_loader.dart';
import 'package:lhstore/utils/helpers/network_manager.dart';

class LoginController extends GetxController{
  //variables//
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final userController = Get.put(UserController());

  //  @override
  //  void onInit(){
  //   email.text = localStorage.read('REMEMBER_ME_EMAIL');
  //   password.text = localStorage.read('REMEMBER_ME_PASSWORD');
  //   super.onInit();
  //  }
  //email and password signIn
  Future<void> emailAndPasswordSignIn() async{
    try{
      LHFullScreenLoader.openLoadingDialog('logging you in', LHImages.darkAppLogo);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected){
        LHFullScreenLoader.stopLoading();
        return;
      }
      if (!loginFormKey.currentState!.validate()){
        LHFullScreenLoader.stopLoading();
        return;
      }
      if(rememberMe.value){
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }
      final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      LHFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e){
      LHFullScreenLoader.stopLoading();
      LHLoader.ErrorSnackBar(title: 'OH Snap', message: e.toString());
    }
  }


Future<void> googleSignIn() async {
  try{
    LHFullScreenLoader.openLoadingDialog('Logging you in...', 'assets/json/loading.json');

    final isConnected = await NetworkManager.instance.isConnected();
    if(!isConnected) {
      LHFullScreenLoader.stopLoading();
      return;
    }

    final userCredentials = await AuthenticationRepository.instance.signInwithGoogle();


    await userController.saveUserRecord(userCredentials);


    LHFullScreenLoader.stopLoading();

    AuthenticationRepository.instance.screenRedirect();

  }catch(e){
    LHFullScreenLoader.stopLoading();
    LHLoader.ErrorSnackBar(title: 'Oh Snap', message: e.toString());
  }
}

}