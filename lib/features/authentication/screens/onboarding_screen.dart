import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lhstore/features/authentication/controllers/controllers_onboarding/on_boarding_controller.dart';
import 'package:lhstore/utils/constants/colors.dart';

import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
   OnBoardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final obcontroller = OnBoardingController();
    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
            pages: obcontroller.pages,
            liquidController: obcontroller.controller,
            onPageChangeCallback: obcontroller.onPgeChangedCallback,
            enableLoop: false,
            waveType: WaveType.circularReveal,
          ),
           Positioned(
            top: 31,
            right: 13,
            child: obcontroller.currentPage.value<5 ? TextButton(
              onPressed: () => obcontroller.skip(),
              style: ElevatedButton.styleFrom(
                primary: LHColor.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Text(
                'Skip',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              ),
            ): SizedBox(),
          ),
          Obx( () => Positioned(
              bottom: 20,
              child: Padding(
                padding: const EdgeInsets.only(left: 105),
                child: AnimatedSmoothIndicator(
                  activeIndex: obcontroller.currentPage.value,
                  effect: const WormEffect(
                    activeDotColor: LHColor.primary,
                    dotHeight: 5.0,
                  ),
                  count: 6,
                ),
              )
              
              ),
          )
        ],
      ),
    );
  }
}