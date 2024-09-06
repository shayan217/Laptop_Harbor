import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lhstore/features/authentication/screens/forget_password/forget_password_option/forget_password_btn_widget.dart';
import 'package:lhstore/features/authentication/screens/password_configration/forget_Password.dart';
import 'package:lhstore/features/authentication/screens/password_phone_configuration/forget_phone_password.dart';
import 'package:lhstore/utils/constants/colors.dart';

class ForgetPasswordScreen {
  static Future<dynamic> BuildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Color(0xffbb8ec1),
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Make Selection!",
              style: GoogleFonts.lato(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: LHColor.secondary,
              ),
            ),
            Text(
              "Select one of the options given below to reset your password",
              style: GoogleFonts.lato(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: LHColor.secondary,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            ForgetPasswordBtnWidget(
                onTap: () {
                  Navigator.pop(context);
                  Get.to(() => ForgetPassword());
                },
                title: "Email",
                subtitle: "Reset via E-Mail Verfication",
                btnIcon: Icons.mail),
            SizedBox(
              height: 25.0,
            ),
            ForgetPasswordBtnWidget(
              onTap: () {
                Navigator.pop(context);
                Get.to(() => ForgetPhonePassword());
              },
              title: "Phone No",
              subtitle: "Reset via Phone Verfication",
              btnIcon: Icons.mobile_friendly_rounded,
            ),
          ],
        ),
      ),
    );
  }
}