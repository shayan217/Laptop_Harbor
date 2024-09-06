import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lhstore/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/constants/sizes.dart';
import 'package:lhstore/utils/constants/text_strings.dart';
import 'package:lhstore/utils/validations/validator.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(ForgetPasswordController());
    
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
              LHText.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(
              height: LHSize.spaceBtwItems * 2,
            ),
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: LHValidator.validateEmail,
                decoration: InputDecoration(
                    labelText: LHText.email,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Set the desired border radius
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: LHColor.primary),
                      borderRadius: BorderRadius.circular(
                          10.0), // Match the same radius as above
                    ),
                    prefixIcon: Icon(Iconsax.direct_right)),
              ),
            ),
            SizedBox(
              height: LHSize.spaceBtwSections,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.sendPasswordResetEmail(),
                style: ElevatedButton.styleFrom(
                  primary:
                      LHColor.primary, // Set the background color to purple
                  side: BorderSide(
                      color: LHColor.primary), // Set the border color to purple
                ),
                child: Text("Submit"),
                // child: Text(
                //   LHText.submit,
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}