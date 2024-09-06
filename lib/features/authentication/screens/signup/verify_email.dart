import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lhstore/data/repositories_authentication/authentication_repository.dart';
import 'package:lhstore/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/constants/sizes.dart';
import 'package:lhstore/utils/constants/text_strings.dart';
import 'package:lottie/lottie.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});
  final String? email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepository.instance.logout(),
            icon: Icon(CupertinoIcons.clear),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(LHSize.defaultSpace),
          child: Column(
            children: [
              Lottie.asset('assets/json/mail.json'),
              SizedBox(
                height: LHSize.spaceBtwSections,
              ),
              Text(
                LHText.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: LHSize.spaceBtwSections,
              ),
              Text(
                email ?? '',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: LHSize.spaceBtwSections,
              ),
              Text(
                LHText.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: LHSize.spaceBtwSections,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.checkEmailVerificationStatus(),
                  style: ElevatedButton.styleFrom(
                    primary:
                        LHColor.primary, // Set the background color to purple
                    // onPrimary: LHColor.primary, // Set the text color to purple
                    side: BorderSide(
                        color:
                            LHColor.primary), // Set the border color to purple
                  ),
                  child: const Text(
                    LHText.LHContinue,
                  ),
                ),
              ),
              SizedBox(
                height: LHSize.spaceBtwItems,
              ),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => controller.sendEmailVerification(),
                    child: const Text(LHText.resendEmail),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
