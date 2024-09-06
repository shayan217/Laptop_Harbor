import 'package:flutter/material.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/constants/sizes.dart';

class OutlinedButtonStore extends StatelessWidget {
  const OutlinedButtonStore({
    super.key,
  });

  Widget _buildOutlinedButton(String label) {
    return OutlinedButton(
      onPressed: () {
        // Add your button logic here
      },
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0), // Set circular border radius
        ),
        side: BorderSide(color: LHColor.primary), // Set border color
      ),
      child: Text(label),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildOutlinedButton('Top Sales%'),
                SizedBox(width: LHSize.md),
                _buildOutlinedButton('Wireless HeadPhones'),
                SizedBox(width: LHSize.md),
                _buildOutlinedButton('Gaming Laptops'),
                SizedBox(width: LHSize.md),
                _buildOutlinedButton('Keyboards'),
              ],
            ),
            SizedBox(
              height: LHSize.spaceBtwItems,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildOutlinedButton('Mac Book'),
                SizedBox(width: LHSize.md),
                _buildOutlinedButton('Gamming Mouse'),
                SizedBox(width: LHSize.md),
                _buildOutlinedButton('HeadPhones'),
                SizedBox(width: LHSize.md),
                _buildOutlinedButton('Laptops Bags'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
