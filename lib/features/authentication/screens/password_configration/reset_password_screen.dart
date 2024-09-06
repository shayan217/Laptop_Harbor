import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lhstore/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:lhstore/features/authentication/screens/login/login.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/constants/sizes.dart';
import 'package:lhstore/utils/constants/text_strings.dart';
import 'package:lhstore/utils/helpers/helpers_fuctions.dart';
import 'package:lottie/lottie.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(), icon: Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(LHSize.defaultSpace),
          child: Column(
            children: [

              SizedBox(
                width: LHHelperFunction.screenWidth() * 0.6,
                child: Lottie.asset('assets/json/forgetpassword.json'),
              ),
              SizedBox(
                height: LHSize.spaceBtwSections,
              ),
              Text(email, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
              SizedBox(
                height: LHSize.spaceBtwSections,
              ),
              Text(
                LHText.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: LHSize.spaceBtwSections,
              ),
              Text(
                LHText.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: LHSize.spaceBtwSections,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAll(() => LoginScreen()),
                  style: ElevatedButton.styleFrom(
                    primary:
                        LHColor.primary, // Set the background color to purple
                    side: BorderSide(
                        color:
                            LHColor.primary), // Set the border color to purple
                  ),
                  child: const Text(
                    LHText.done,
                  ),
                ),
              ),
              SizedBox(
                height: LHSize.spaceBtwSections,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () => ForgetPasswordController.instance.resendPasswordResetEmail(email), child: Text(LHText.resendEmail)),
              )
            ],
          ),
        ),
      ),
    );
  }
}