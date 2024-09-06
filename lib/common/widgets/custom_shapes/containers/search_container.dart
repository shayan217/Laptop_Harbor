import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/constants/sizes.dart';
import 'package:lhstore/utils/device/device_utility.dart';
import 'package:lhstore/utils/helpers/helpers_fuctions.dart';

class LHSearchContainer extends StatelessWidget {
  const LHSearchContainer(
      {super.key,
      required this.text,
      this.icon = Iconsax.search_normal,
      this.showBackground = true,
      this.showBorder = true,
      this.onTap,
      this.padding = const EdgeInsets.symmetric(horizontal: 24.0),
      });
      

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = LHHelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: LHDeviceUtility.getScreenwidth(context),
          // LHSearchContainer(),
          padding: EdgeInsets.all(LHSize.md),
          decoration: BoxDecoration(
              color: showBackground
                  ? dark
                      ? LHColor.dark
                      : LHColor.light
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(LHSize.cardRadiusLg),
              border: showBorder ? Border.all(color: (dark ? LHColor.black : LHColor.white)) : null),
          child: Row(
            children: [
              Icon(
                icon,
                color: (dark ? LHColor.white : LHColor.black)
              ),
              SizedBox(
                width: LHSize.spaceBtwItems,
              ),
              Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(
                      color: (dark ? LHColor.white : LHColor.black), // Change 'Colors.blue' to your desired color
                    )
                    .copyWith(),
              )
            ],
          ),
        ),
      ),
    );
  }
}