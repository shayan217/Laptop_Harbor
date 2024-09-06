import 'package:flutter/material.dart';
import 'package:lhstore/utils/constants/colors.dart';

class LHShadowStyle{
  static final verticalProductShadow = BoxShadow(
    color: LHColor.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: Offset(0, 2)
  );
  static final horizontalProductShadow = BoxShadow(
    color: LHColor.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: Offset(0, 2)
  );
}