import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lhstore/navigation_menu.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/constants/text_strings.dart';
import 'package:lottie/lottie.dart';

class checkout_complete_widget extends StatelessWidget {
  const checkout_complete_widget({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: height * 0.6,
          child: Lottie.asset('assets/json/checkout_payment.json'),
        ),
        Column(
      mainAxisAlignment: MainAxisAlignment.center, // Center the children vertically
      children: [
        Text(
          LHText.checkout_complete,
          style: GoogleFonts.lato(
    fontSize: 34,
    fontWeight: FontWeight.w700,
    color: LHColor.accent,
          ),
          textAlign: TextAlign.center, // Center the text horizontally
        ),
      ],
    ),
    
       Row(
      children: [
        Expanded(
          child: OutlinedButton(
    onPressed: () {
      Get.to(NavigationMenu());
    },
    style: OutlinedButton.styleFrom(
      foregroundColor: LHColor.accent,
      side: BorderSide(color: LHColor.primary), // Set the border color to purple
      padding: EdgeInsets.symmetric(vertical: 15.0),
    ),
    child: Text(LHText.done.toUpperCase()),
          ),
        ),
      ],
    )
    
      ],
    );
  }
}