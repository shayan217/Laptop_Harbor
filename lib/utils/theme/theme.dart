import 'package:flutter/material.dart';
import 'package:lhstore/utils/theme/custom_themes.dart/appbar_theme.dart';
import 'package:lhstore/utils/theme/custom_themes.dart/bottom_sheat_theme.dart';
import 'package:lhstore/utils/theme/custom_themes.dart/cheakbox_theme.dart';
import 'package:lhstore/utils/theme/custom_themes.dart/chip_theme.dart';
import 'package:lhstore/utils/theme/custom_themes.dart/elevated_button_theme.dart';
import 'package:lhstore/utils/theme/custom_themes.dart/outlined_theme.dart';
import 'package:lhstore/utils/theme/custom_themes.dart/text_feild_theme.dart';
import 'package:lhstore/utils/theme/custom_themes.dart/text_theme.dart';



class LHAppTheme{
  LHAppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: LHTextTheme.lightTextTheme,
    chipTheme: LHChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: LHAppBarTheme.LightAppBarTheme,
    checkboxTheme: LHCheckBoxTheme.lightCheckboxTheme,
    bottomSheetTheme: LHBottomSheetTheme.LightBottomSheetTheme,
    elevatedButtonTheme: LHElevatedButtonTheme.LightElevatedButtonTheme,
    outlinedButtonTheme: LHOutlinedButtonTheme.LightOutLinedButtonTheme,
    inputDecorationTheme: LHTestFormFieldTheme.lightInputDecorationTheme
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: LHTextTheme.darkTextTheme,
    chipTheme: LHChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: LHAppBarTheme.DarkAppBarTheme,
    checkboxTheme: LHCheckBoxTheme.darkCheckboxTheme,
    bottomSheetTheme: LHBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: LHElevatedButtonTheme.DarkElevatedButtonTheme,
    outlinedButtonTheme: LHOutlinedButtonTheme.darkOutLinedButtonTheme,
    inputDecorationTheme: LHTestFormFieldTheme.darkInputDecorationTheme
  );

}