import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lhstore/utils/constants/colors.dart';

class LHLoader{
  static successSnackBar({required title, message = '', duration = 3}){
    Get.snackbar(
      title, 
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: LHColor.white,
      backgroundColor: LHColor.primary,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: EdgeInsets.all(10),
      icon: Icon(Iconsax.check, color: LHColor.white,)
      );
  }

    static success1SnackBar({required title, message = '', duration = 3}){
    Get.snackbar(
      title, 
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: LHColor.black,
      backgroundColor: LHColor.primary1,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: EdgeInsets.all(10),
      icon: Icon(Iconsax.check, color: LHColor.black,)
      );
  }

   static WarningSnackBar({required title, message = '', duration = 3}){
    Get.snackbar(
      title, 
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: LHColor.white,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 3),
      margin: EdgeInsets.all(20),
      icon: Icon(Iconsax.warning_2, color: LHColor.white,)
      );
  }
  static ErrorSnackBar({required title, message = '', duration = 3}){
    Get.snackbar(
      title, 
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: LHColor.white,
      backgroundColor: Colors.red.shade300,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 3),
      margin: EdgeInsets.all(20),
      icon: Icon(Iconsax.danger, color: LHColor.white,)
      );
  }
}