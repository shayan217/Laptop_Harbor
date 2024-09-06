import 'package:flutter/material.dart';
import 'package:lhstore/utils/constants/colors.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    super.key,
    required this.buttonTitle,
    this.onTap,
  });
  final String buttonTitle;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(buttonTitle),
        style: ElevatedButton.styleFrom(
          backgroundColor: LHColor.primary,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(100.0), // Adjust the radius as needed
          ),
          side: BorderSide(color: LHColor.primary), // Set the border color here
        ),
      ),
    );
  }
}
