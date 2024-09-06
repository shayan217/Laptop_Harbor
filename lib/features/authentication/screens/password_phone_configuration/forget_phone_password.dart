import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lhstore/features/authentication/screens/password_phone_configuration/reset_phone_password.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/constants/sizes.dart';
import 'package:lhstore/utils/constants/text_strings.dart';

class ForgetPhonePassword extends StatelessWidget {
  const ForgetPhonePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(LHSize.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LHText.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: LHSize.spaceBtwItems,
            ),
            Text(
              LHText.forgetPhonePasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(
              height: LHSize.spaceBtwItems * 2,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: LHText.phoneNo, prefixIcon: Icon(Iconsax.call)),
            ),
            SizedBox(
              height: LHSize.spaceBtwSections,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.off(ResetPhonePassword());
                },
                style: ElevatedButton.styleFrom(
                  primary:
                      LHColor.primary, // Set the background color to purple
                  side: BorderSide(
                      color: LHColor.primary), // Set the border color to purple
                ),
                child: Text(
                  LHText.submit,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
