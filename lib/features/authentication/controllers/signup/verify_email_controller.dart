import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:lhstore/common/widgets/success_screen/success_screen.dart';
import 'package:lhstore/data/repositories_authentication/authentication_repository.dart';
import 'package:lhstore/utils/constants/text_strings.dart';
import 'package:lhstore/utils/helpers/customSnakbar.dart';

class VerifyEmailController extends GetxController{
  static VerifyEmailController get instance => Get.find();
  // Send emailwhen ever Verify Screen appears & set timer for auto redirect//
  @override
  void onInit(){
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }
  //send email verification link//
  sendEmailVerification() async{
    try{
      await AuthenticationRepository.instance.sendEmailVerification();
      LHLoader.successSnackBar(title: 'Email Sent', message: 'Please Check your inbox and verify your email.');
    }catch(e){
      LHLoader.ErrorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
  // Timer to automatically redirect on Email Verification//
  setTimerForAutoRedirect(){
    Timer.periodic(const Duration(seconds: 1), (timer) async { 
    await  FirebaseAuth.instance.currentUser?.reload();
    final user = FirebaseAuth.instance.currentUser;
    if(user?.emailVerified ?? false){
      timer.cancel();
      Get.off(() => SuccessScreen(
        image: "assets/json/sending.json",
        title: LHText.yourAccountCreatedTitle,
        subtitle: LHText.yourAccountCreatedSubTitle,
        onPressed: ()=> AuthenticationRepository.instance.screenRedirect()
      ));
    }
    });
  }
  // Manually check if email verified//
  checkEmailVerificationStatus(){
    final currentUser =  FirebaseAuth.instance.currentUser;
    if(currentUser != null && currentUser.emailVerified){
      Get.off(
        ()=> SuccessScreen(
          image: "assets/json/mail.json", 
          title: "Your account is created", 
          subtitle: "Your account is created", 
          onPressed: ()=> AuthenticationRepository.instance.screenRedirect()
          ),
      );
    }
  }
}