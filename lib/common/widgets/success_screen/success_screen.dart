import 'package:flutter/material.dart';
import 'package:lhstore/common/styles/spacing_style.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/constants/sizes.dart';
import 'package:lhstore/utils/constants/text_strings.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onPressed,
    
    });
  final String image, title, subtitle;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: LHSpacingStyle.paddingwithAppBarHeight * 2,
          child: Column(
            children: [
              Lottie.asset(image, width: MediaQuery.of(context).size.width * 0.6),
              SizedBox(
                height: LHSize.spaceBtwSections,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: LHSize.spaceBtwSections,
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: LHSize.spaceBtwSections,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    primary:
                        LHColor.primary, // Set the background color to purple
                    side: BorderSide(
                        color:
                            LHColor.primary), // Set the border color to purple
                  ),
                  child: const Text(
                    LHText.LHContinue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
