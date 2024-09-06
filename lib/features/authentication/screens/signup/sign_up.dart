import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lhstore/features/authentication/controllers/signup/signup_controller.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/constants/image_strings.dart';
import 'package:lhstore/utils/constants/sizes.dart';
import 'package:lhstore/utils/constants/text_strings.dart';
import 'package:lhstore/utils/form_devider/form_devider.dart';
import 'package:lhstore/utils/helpers/helpers_fuctions.dart';
import 'package:lhstore/utils/validations/validator.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    final dark = LHHelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(LHSize.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LHText.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: LHSize.spaceBtwItems,
              ),

              Form(
                key: controller.signupFormKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: controller.firstName,
                            validator: (value) => LHValidator.validateEmptyText(
                                'First Name', value),
                            expands: false,
                            decoration: InputDecoration(
                              labelText: LHText.firstName,
                              prefixIcon: Icon(Iconsax.user),
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
                        SizedBox(
                          width: LHSize.spaceBtwInputFields,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: controller.lastName,
                            validator: (value) => LHValidator.validateEmptyText(
                                'Last Name', value),
                            expands: false,
                            decoration: InputDecoration(
                              labelText: LHText.lastName,
                              prefixIcon: Icon(Iconsax.user),
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
                    SizedBox(
                      height: LHSize.spaceBtwInputFields,
                    ),
                    TextFormField(
                      controller: controller.userName,
                      validator: (value) =>
                          LHValidator.validateEmptyText('UserName', value),
                      expands: false,
                      decoration: InputDecoration(
                        labelText: LHText.username,
                        prefixIcon: Icon(Iconsax.user),
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
                    TextFormField(
                      controller: controller.email,
                      validator: (value) => LHValidator.validateEmail(value),
                      expands: false,
                      decoration: InputDecoration(
                        labelText: LHText.email,
                        prefixIcon: Icon(Iconsax.direct),
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
                    TextFormField(
                      controller: controller.phoneNumber,
                      validator: (value) =>
                          LHValidator.validatePhoneNumber(value),
                      expands: false,
                      decoration: InputDecoration(
                        labelText: LHText.phoneNo,
                        prefixIcon: Icon(Iconsax.call),
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
                    Obx(
                      () => TextFormField(
                        controller: controller.password,
                        validator: (value) =>
                            LHValidator.validatePassword(value),
                        expands: false,
                        obscureText: controller.hidePassword.value,
                        decoration: InputDecoration(
                          labelText: LHText.password,
                          prefixIcon: Icon(Iconsax.password_check),
                          suffixIcon: IconButton(
                            onPressed: ()=> controller.hidePassword.value = !controller.hidePassword.value,
                            icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                          ),
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
                    SizedBox(
                      height: LHSize.spaceBtwInputFields,
                    ),
                    Row(
                      children: [
                        SizedBox(
                            width: 24,
                            height: 24,
                            child: Obx(
                              () => Checkbox(
                                value: controller.privacyPolicy.value,
                                onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value,
                                activeColor: LHColor.primary,
                              ),
                            )),
                        SizedBox(
                          width: LHSize.spaceBtwItems,
                        ),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                              text: '${LHText.iAgreeTo}',
                              style: Theme.of(context).textTheme.bodySmall),
                          TextSpan(
                              text: LHText.privacyPolicy,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .apply(
                                      color: dark
                                          ? LHColor.white
                                          : LHColor.primary,
                                      decoration: TextDecoration.underline,
                                      decorationColor: dark
                                          ? LHColor.white
                                          : LHColor.primary)),
                          TextSpan(
                              text: ' ${LHText.and} ',
                              style: Theme.of(context).textTheme.bodySmall),
                          TextSpan(
                              text: LHText.termsOfUse,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .apply(
                                      color: dark
                                          ? LHColor.white
                                          : LHColor.primary,
                                      decoration: TextDecoration.underline,
                                      decorationColor: dark
                                          ? LHColor.white
                                          : LHColor.primary)),
                        ]))
                      ],
                    ),
                    SizedBox(
                      height: LHSize.spaceBtwSections,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            controller.signup();
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                LHColor.primary),
                            side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(color: LHColor.primary)),
                          ),
                          child: Text(LHText.createAccount)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              LHFormDivider(dividerText: LHText.orSignInWith.capitalize!),
              SizedBox(
                height: 20.0,
              ),

              //footer
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: LHColor.grey),
                        borderRadius: BorderRadius.circular(15)),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                        width: LHSize.iconMd,
                        height: LHSize.iconMd,
                        image: AssetImage(LHImages.google),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: LHSize.spaceBtwItems,
                  ),
                  Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: LHColor.grey),
                        borderRadius: BorderRadius.circular(15)),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                        width: LHSize.iconMd,
                        height: LHSize.iconMd,
                        image: AssetImage(LHImages.facbook),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: LHSize.spaceBtwSections,
              )
            ],
          ),
        ),
      ),
    );
  }
}
