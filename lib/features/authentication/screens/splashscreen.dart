import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lhstore/data/repositories_authentication/authentication_repository.dart';
import 'package:lhstore/features/authentication/controllers/splash_controller/splash_controller.dart';
import 'package:lhstore/features/authentication/screens/onboarding_screen.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final deviceStorage = GetStorage();
  final splashController = Get.put(SplashScreenController());

  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), (){
      screenRedirect();
    });
  }
  void screenRedirect(){
    bool isFirstTime = deviceStorage.read('IsFirstTime') ?? true;
    if(isFirstTime){
      Get.offAll(OnBoardingScreen());
      deviceStorage.write('IsFirstTime', false);
    }else{
      AuthenticationRepository.instance.screenRedirect();
    }
  }
  Widget build(BuildContext context) {
    splashController.startAnimation();
    return Scaffold(
      backgroundColor: LHColor.accent,
      body: Stack(
        children: [
          Obx(
            () => AnimatedPositioned(
                duration: const Duration(milliseconds: 1600),
                top: splashController.animate.value ? -5 : 10,
                left: splashController.animate.value ? -39 : 10,
                child: Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: LHColor.primary),
                )),
          ),
          Obx(
            () => AnimatedPositioned(
                duration: const Duration(milliseconds: 1600),
                top: 560,
                left: splashController.animate.value ? -39 : -10,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: LHColor.primary),
                )),
          ),
          Obx(
            () => AnimatedPositioned(
                duration: const Duration(milliseconds: 1800),
                top: 80,
                left: splashController.animate.value ? 30.0 : -30,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 1800),
                  opacity: splashController.animate.value ? 1 : 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Laptop Harbor/",
                        style: GoogleFonts.novaSquare(
                          textStyle: Theme.of(context).textTheme.displaySmall,
                          fontSize: 25,
                          fontWeight: FontWeight.w100,
                          color: LHColor.secondary,
                          letterSpacing: 2,
                        ),
                      ),
                      Text(
                        "Compact e-Store for",
                        style: GoogleFonts.novaSquare(
                          textStyle: Theme.of(context).textTheme.displaySmall,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: LHColor.secondary,
                          letterSpacing: 2,
                        ),
                      ),
                      Text(
                        "convenient shopping",
                        style: GoogleFonts.novaSquare(
                          textStyle: Theme.of(context).textTheme.headline6,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: LHColor.secondary,
                          letterSpacing: 2,
                        ),
                      )
                    ],
                  ),
                )),
          ),
          Obx(
            () => Positioned(
              bottom: splashController.animate.value ? 200 : 285,
              child: Opacity(
                opacity: splashController.animate.value ? 1 : 0,
                child: SizedBox(
                  width: 380,
                  height: 380,
                  child: Lottie.asset('assets/json/laptop.json'),
                ),
              ),
              left: 2,
            ),
          ),
          Obx(
            () => AnimatedPositioned(
                duration: const Duration(milliseconds: 1800),
                bottom: -5,
                right: splashController.animate.value ? -39 : 30,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 1800),
                  opacity: splashController.animate.value ? 1 : 0,
                  child: Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: LHColor.primary,
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
