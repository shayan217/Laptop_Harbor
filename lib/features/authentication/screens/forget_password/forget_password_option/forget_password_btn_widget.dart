import 'package:flutter/material.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/helpers/helpers_fuctions.dart';

class ForgetPasswordBtnWidget extends StatelessWidget {
  const ForgetPasswordBtnWidget({
    required this.btnIcon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    super.key,
  });
  final IconData btnIcon;
  final String title, subtitle;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final dark = LHHelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: dark? LHColor.Textprimary : LHColor.light),
          child: Row(children: [
            Icon(
              btnIcon,
              size: 60.0,
            ),
            SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyText2,
                )
              ],
            )
          ])),
    );
  }
}