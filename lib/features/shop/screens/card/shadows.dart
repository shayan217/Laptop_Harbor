import 'package:flutter/material.dart';

class ShadowStyle{
  static final verticalProductShadow = BoxShadow(
    color: const Color.fromARGB(255, 122, 122, 122).withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );


  static final horizontalProductShadow = BoxShadow(
    color: const Color.fromARGB(255, 122, 122, 122).withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );
}