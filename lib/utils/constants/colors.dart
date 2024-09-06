import 'package:flutter/material.dart';

class LHColor{
  LHColor._();
  // App Basic Colors//
  static const Color primary = Color(0xff8e4398);
  static const Color primary1 = Color(0xffd1b3d5);
  static const Color secondary = Colors.black;
  static const Color accent = Colors.white;
  // Text Colors//
  static const Color Textprimary = Color(0xff333333);
  static const Color Textsecondary = Color(0xff6c7570);
  static const Color Textwhite = Colors.white;
  // background Color//
  static const Color light = Color(0xfff6f6f6);
  static const Color dark = Color(0xff272727);
  static const Color primaryBackground = Color.fromARGB(255, 234, 234, 236);
  // backgorund container color//
  static const Color lightContainer = Color(0xfff6f6f6);
  static Color darkContainer = LHColor.white.withOpacity(0.1);
  // buttons color//
  static const Color buttonPrimary = Color(0xff4b68ff);
  static const Color buttonSecondary = Color(0xff6c757d);
  static const Color buttonDisabled = Color(0xffc4c4c4);
  // Border Color//
  static const Color borderPrimary = Color(0xffd9d9d9);
  static const Color borderSecondary = Color(0xffe6e6e6);
  // Error and Validations Colors//
  static const Color error = Color(0xffd32f2f);
  static const Color success = Color(0xff388e3c);
  static const Color warning = Color(0xfff57c00);
  static const Color info = Color(0xff1976d2);
  // Netural Shades//
  static const Color black = Color(0xff232323);
  static const Color darkerGrey = Color(0xff4f4f4f);
  static const Color darkGrey = Color(0xff939393);
  static const Color grey = Color(0xffe0e0e0);
  static const Color softGrey = Color(0xfff4f4f4);
  static const Color lightGrey = Color(0xfff9f9f9);
  static const Color white = Color(0xffffffff);
  
  // Gradiant Color//
  static Gradient linearGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color(0xff9855d7),
      Color(0xffb967e1),
      Color(0xffbb6eee),
      Color(0xffcc7dfd),

    ]
  );

   static Gradient linearGradient1 = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color.fromARGB(255, 19, 1, 35),
      Color.fromARGB(255, 23, 21, 23),
      Color.fromARGB(255, 73, 72, 74),
      Color.fromARGB(255, 81, 81, 81),

    ]
  );
  static const Color gra1 = Color(0xff914ece);
  static const Color gra2 = Color(0xffc26ee3);
  static const Color gra3 = Color(0xffd17cf4);
  static const Color gra4 = Color(0xffc87bf9);
  
  }