import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lhstore/common/styles/spacing_style.dart';
import 'package:lhstore/features/authentication/controllers/login/login_controller.dart';
import 'package:lhstore/features/authentication/screens/forget_password/forget_password_option/forget_password_Modal_BottomSheat.dart';
import 'package:lhstore/features/authentication/screens/signup/sign_up.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/constants/image_strings.dart';
import 'package:lhstore/utils/constants/sizes.dart';
import 'package:lhstore/utils/constants/text_strings.dart';
import 'package:lhstore/utils/helpers/helpers_fuctions.dart';
import 'package:lhstore/utils/validations/validator.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controllers = Get.put(LoginController());

    final controller = Get.put(LoginController());
    final dark = LHHelperFunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: LHSpacingStyle.paddingwithAppBarHeight,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    height: 150,
                    image: AssetImage(
                        dark ? LHImages.lightAppLogo : LHImages.darkAppLogo),
                  ),
                  Text(
                    LHText.loginTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(
                    height: LHSize.sm,
                  ),
                  Text(
                    LHText.loginSubTitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),

              ///Form///
              Form(
                key: controller.loginFormKey,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: LHSize.spaceBtwSections),
                  child: Column(
                    children: [
                      //email
                      TextFormField(
                        controller: controller.email,
                        validator: (value) => LHValidator.validateEmail(value),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.direct_right),
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
                      SizedBox(height: LHSize.spaceBtwInputFields / 2),
                      //Reemember password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //rember me
                          Row(
                            children: [
                              Obx(
                                ()=> Checkbox(
                                  value: controller.rememberMe.value,
                                  onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value,
                                  activeColor: LHColor.primary,
                                ),
                              ),
                              Text(LHText.rememberme),
                            ],
                          ),
                          // forget password
                          TextButton(
                            onPressed: () {
                              ForgetPasswordScreen.BuildShowModalBottomSheet(
                                  context);
                            },
                            child: Text(LHText.forgetPassword),
                          ),
                        ],
                      ),
                      SizedBox(height: LHSize.spaceBtwSections),
                      //sign in
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => controller.emailAndPasswordSignIn(),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                LHColor.primary),
                            side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(color: LHColor.primary)),
                          ),
                          child: Text(
                            LHText.signin,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: LHSize.spaceBtwItems,
                      ),

                      //sign up
                      SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                              onPressed: () {
                                Get.to(SignUpScreen());
                              },
                              style: ButtonStyle(
                                side: MaterialStateProperty.all<BorderSide>(
                                    BorderSide(color: LHColor.primary)),
                              ),
                              child: Text(LHText.createAccount))),
                    ]
                  ),
                ),
              ),
              //divider
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Divider(
                      color: dark ? LHColor.darkGrey : LHColor.grey,
                      thickness: 0.5,
                      indent: 60,
                      endIndent: 5, // Set endIndent to 5 for the first Divider
                    ),
                  ),
                  Text(
                    LHText.orSignInWith.capitalize!,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Flexible(
                    child: Divider(
                      color: dark ? LHColor.darkGrey : LHColor.grey,
                      thickness: 0.5,
                      indent: 5, // Set indent to 5 for the second Divider
                      endIndent:
                          60, // Set endIndent to 60 for the second Divider
                    ),
                  ),
                ],
              ),

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
                      onPressed: () => controllers.googleSignIn(),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}