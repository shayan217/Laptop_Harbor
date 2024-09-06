import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/helpers/animation_loader.dart';
import 'package:lhstore/utils/helpers/helpers_fuctions.dart';

class LHFullScreenLoader{
  static void openLoadingDialog(String text, String animation){
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_)=> PopScope(
        canPop: false,
        child: Container(
          color: LHHelperFunction.isDarkMode(Get.context!) ? LHColor.dark : LHColor.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 250,),
              LHAnimationLoader(text: text, animation: animation),
            ],
          ),
        ),
      )
    );
  }
  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}