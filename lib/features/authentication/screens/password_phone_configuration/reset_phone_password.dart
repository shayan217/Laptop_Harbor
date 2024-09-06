import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/constants/sizes.dart';
import 'package:lhstore/utils/constants/text_strings.dart';
import 'package:lhstore/utils/helpers/helpers_fuctions.dart';
import 'package:lottie/lottie.dart';

class ResetPhonePassword extends StatelessWidget {
   ResetPhonePassword({super.key});


  @override
  Widget build(BuildContext context) {
    final dark = LHHelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: ()=> Get.back(), icon: Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(LHSize.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: LHHelperFunction.screenWidth() * 0.6,
                child: Lottie.asset('assets/json/phonessend.json'),
              ),
              SizedBox(
                height: LHSize.spaceBtwSections,
              ),
              Text(
                LHText.changeYourPhonePasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: LHSize.spaceBtwItems,
              ),
              Text(
                LHText.chnageYourPhonePasswordSubTitle,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              Text("+92 316 203 6763"),
              SizedBox(
                height: LHSize.spaceBtwSections,
              ),

                OtpTextField(
              numberOfFields: 6,
              fillColor: dark ? LHColor.accent : LHColor.secondary,
              filled: true,
              onSubmit: (code){print("Otp is => $code");},
              cursorColor: LHColor.primary,
              focusedBorderColor: LHColor.primary,
            ),

               SizedBox(
                height: LHSize.spaceBtwSections,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    
                  },
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
                child: TextButton(onPressed: (){}, child: Text(LHText.resendPhone)),
              )
            ],
          ),
        ),
      ),
    );
  }
}