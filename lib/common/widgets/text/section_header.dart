import 'package:flutter/material.dart';
import 'package:lhstore/utils/constants/colors.dart';

class LHSectionHeading extends StatelessWidget {
  const LHSectionHeading({super.key,
  this.onPressed,
  this.textColor,
  this.buttonTitle = 'View all',
  required this.title,
  this.showActionButton = true,});
  
  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium !.apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
       if(showActionButton) TextButton(
        onPressed: onPressed, 
        child: Text(buttonTitle, style: TextStyle(color: LHColor.primary),))
      ],
    );
  }
}