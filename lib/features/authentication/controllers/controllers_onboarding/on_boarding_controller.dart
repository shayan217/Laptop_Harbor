
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lhstore/features/authentication/models/onboarding_modal.dart';
import 'package:lhstore/features/authentication/screens/onboarding_page_widget.dart';
import 'package:lhstore/features/authentication/screens/welcome/welcome.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/constants/image_strings.dart';
import 'package:lhstore/utils/constants/text_strings.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

class OnBoardingController extends GetxController {
  final controller = LiquidController();
  RxInt currentPage = 0.obs;

  final pages = [
    // 1//
    OnBoardingPageWidget(
      modal: OnBoardingModal(
          image: LHImages.OnBoardingImage1,
          title: LHText.OnBoardingTitle1,
          subTitle: LHText.OnBoardingSubTitle1,
          bgColor: LHColor.accent),
    ),
    // 2//
    Container(
      color: LHColor.secondary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(LHImages.OnBoardingImage2),
          ),
          Column(
            children: [
              Text(
                textAlign: TextAlign.center,
                LHText.OnBoardingTitle2,
                style: GoogleFonts.knewave(
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                  color: LHColor.accent,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                LHText.OnBoardingSubTitle2,
                textAlign: TextAlign.center,
                style: TextStyle(color: LHColor.accent, fontSize: 15),
              ),
            ],
          ),
        ],
      ),
    ),
    // 3//
    OnBoardingPageWidget(
      modal: OnBoardingModal(
          image: LHImages.OnBoardingImage3,
          title: LHText.OnBoardingTitle3,
          subTitle: LHText.OnBoardingSubTitle3,
          bgColor: LHColor.accent),
    ),
    // 4//
    Container(
      color: LHColor.secondary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(LHImages.OnBoardingImage4),
          ),
          Column(
            children: [
              Text(
                textAlign: TextAlign.center,
                LHText.OnBoardingTitle4,
                style: GoogleFonts.knewave(
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                  color: LHColor.accent,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                LHText.OnBoardingSubTitle4,
                textAlign: TextAlign.center,
                style: TextStyle(color: LHColor.accent, fontSize: 15),
              ),
            ],
          ),
        ],
      ),
    ),
    // 5//
    Container(
      color: LHColor.accent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(LHImages.OnBoardingImage5),
          ),
          Column(
            children: [
              Text(
                textAlign: TextAlign.center,
                LHText.OnBoardingTitle5,
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
                LHText.OnBoardingSubTitle5,
                textAlign: TextAlign.center,
                style: TextStyle(color: LHColor.secondary, fontSize: 15),
              ),
            ],
          ),
        ],
      ),
    ),
    // 6//
    Container(
      color: LHColor.secondary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(LHImages.OnBoardingImage6),
          ),
          Column(
            children: [
              Text(
                textAlign: TextAlign.center,
                LHText.OnBoardingTitle6,
                style: GoogleFonts.knewave(
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                  color: LHColor.accent,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                LHText.OnBoardingSubTitle6,
                textAlign: TextAlign.center,
                style: TextStyle(color: LHColor.accent, fontSize: 15),
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    // final storage = GetStorage();
                    //  if(kDebugMode){
                    //   print('============ Get Storage next button ==============');
                    //   print(storage.read('IsFirstTime'));
                    //  }
                    //  storage.write('IsFirstTime', false);
                    //  if(kDebugMode){
                    //   print('============ Get Storage next button ==============');
                    //   print(storage.read('IsFirstTime'));
                    //  }
                    // storage.write('IsFirstTime', false);
                    Get.to(welcomeScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    primary: LHColor.secondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(29.0),
                    ),
                    side: BorderSide(
                        color: LHColor.primary), // Set border color to white
                  ),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: LHColor.accent,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    )
  ];

  get onPageChangedCallback => null;

  void onPgeChangedCallback(int activePageIndex) =>
      currentPage.value = activePageIndex;
  skip() => controller.jumpToPage(page: 5);
}
