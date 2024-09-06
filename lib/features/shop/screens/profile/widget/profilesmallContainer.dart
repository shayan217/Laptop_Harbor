import 'package:flutter/material.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/helpers/helpers_fuctions.dart';

Widget buildSmallContainer(String imageUrl, {bool isShimmer = false}) {

  if (isShimmer) {
    return Container(
      width: 80,
      height: 80,
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LHColor.linearGradient1,
      ),
    );
  }

  return Container(
    width: 80,
    height: 80,
    margin: EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: LHColor.dark,
      borderRadius: BorderRadius.circular(8),
      image: DecorationImage(
        image: NetworkImage(imageUrl),
        fit: BoxFit.cover,
      ),
    ),
  );
}
