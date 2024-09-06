import 'package:flutter/material.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/helpers/helpers_fuctions.dart';
import 'package:shimmer/shimmer.dart';

class LHShimmerEffect extends StatelessWidget {
  const LHShimmerEffect({
    Key? key,
    required this.height,
    required this.width,
    this.radius = 15,
    this.color,
    }) : super(key: key);
  final double width, height, radius;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    final dark = LHHelperFunction.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? (dark ? LHColor.darkGrey : LHColor.white ),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}