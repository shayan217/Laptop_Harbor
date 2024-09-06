import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lhstore/features/authentication/models/onboarding_modal.dart';
import 'package:lhstore/utils/constants/colors.dart';

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    super.key,
    required this.modal,
  });
  final OnBoardingModal modal;
  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return Container(
      color: modal.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(modal.image),
            height: Size.height * 0.5,
          ),
          Column(
            children: [
              Text(
                textAlign: TextAlign.center,
                modal.title,
                style: GoogleFonts.knewave(
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                  color: LHColor.secondary,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                modal.subTitle,
                textAlign: TextAlign.center,
                style: TextStyle(color: LHColor.secondary, fontSize: 15),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
