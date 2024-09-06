import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lhstore/features/personlization/controllers/user_controller.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/constants/sizes.dart';
import 'package:lhstore/utils/constants/text_strings.dart';
import 'package:lhstore/utils/validations/validator.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(title: const Text("Re-Authenticate User")),
      body: SingleChildScrollView(
        child: Padding(
        padding: EdgeInsets.all(LHSize.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: controller.reAuthFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.verifyEmail,
                    validator:  LHValidator.validateEmail,
                    expands: false,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.user),
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
                    ),
                  ),
                  
                  SizedBox(
                    height: LHSize.spaceBtwInputFields,
                  ),
                  //password
                  Obx(
                    () => TextFormField(
                      obscureText: controller.hidePassword.value,
                      controller: controller.verifyPassword,
                      validator: (value) => LHValidator.validateEmptyText('Password', value),
                      expands: false,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.user),
                        suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                          icon: Icon(Iconsax.eye_slash),
                        ),
                        labelText: LHText.password,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Set the desired border radius
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: LHColor.primary),
                          borderRadius: BorderRadius.circular(
                              10.0), // Match the same radius as above
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: LHSize.spaceBtwItems * 4,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () => controller.reAuthenticateEmailAndPasswordUser(),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(LHColor.primary),
                  side: MaterialStateProperty.all<BorderSide>(
                      BorderSide(color: LHColor.primary)),
                  minimumSize: MaterialStateProperty.all<Size>(
                    Size(200, 50), // Adjust width and height as needed
                  ),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
                ),
      ),
    );
  }
}