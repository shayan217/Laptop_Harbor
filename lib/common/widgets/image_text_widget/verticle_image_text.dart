import 'package:flutter/material.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/constants/sizes.dart';
import 'package:lhstore/utils/helpers/helpers_fuctions.dart';

class LHVerticalImageText extends StatelessWidget {
  const LHVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = LHColor.white,
    this.backgroundColor,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = LHHelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: LHSize.spaceBtwItems),
        child: Column(
          children: [
            Container(
              width: 100,
              height: 40,
              padding: EdgeInsets.all(LHSize.sm),
              decoration: BoxDecoration(
                color:
                    backgroundColor ?? (dark ? LHColor.dark : LHColor.light),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Image.network(
                  image, // Use Image.network for loading images from URLs
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: LHSize.spaceBtwItems / 2,
            ),
            SizedBox(
              width: 30,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: (dark ? LHColor.light : LHColor.dark)),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
