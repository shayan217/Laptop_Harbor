import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lhstore/features/authentication/screens/login/login.dart';
import 'package:lhstore/features/authentication/screens/signup/sign_up.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/constants/text_strings.dart';
import 'package:lottie/lottie.dart';

class welcomeScreen extends StatelessWidget {
  const welcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: LHColor.secondary,
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: height * 0.6,
              child: Lottie.asset('assets/json/welcomee.json'),
            ),
            Column(
              children: [
                Text(
                  LHText.WelcomeText1,
                  style: GoogleFonts.lato(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                    color: LHColor.accent,
                  ),
                ),
                Text(
                  LHText.WelcomeText2,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: LHColor.accent,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                      onPressed: () {
                        Get.to(LoginScreen());
                      },
                      style: OutlinedButton.styleFrom(
                          
                          foregroundColor: LHColor.accent,
                          side: BorderSide(color: LHColor.Textwhite),
                          padding: EdgeInsets.symmetric(vertical: 15.0)),
                      child: Text(LHText.LoginText.toUpperCase())),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(SignUpScreen());
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          
                          foregroundColor: LHColor.accent,
                          backgroundColor: LHColor.primary,
                          side: BorderSide(color: LHColor.primary),
                          padding: EdgeInsets.symmetric(vertical: 15.0)),
                      child: Text(LHText.SignupText.toUpperCase())),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
