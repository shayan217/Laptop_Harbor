import 'package:flutter/material.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/helpers/helpers_fuctions.dart';


class LHFormDivider extends StatelessWidget {
  const LHFormDivider({super.key, required this.dividerText});
final String dividerText;
  @override
  Widget build(BuildContext context) {
    final dark = LHHelperFunction.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Divider(color: dark ? LHColor.darkGrey : LHColor.grey, thickness: 0.5, indent: 60, endIndent: 5,)),
        Text(dividerText, style: Theme.of(context).textTheme.labelMedium,),
        Flexible(child: Divider(color: dark ?  LHColor.darkGrey : LHColor.grey, thickness: 0.5, indent: 5, endIndent: 60,))
      ],
    );
  }
}