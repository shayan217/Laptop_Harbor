import 'dart:ui';

class OnBoardingModal {
  final String image;
  final String title;
  final String subTitle;
  final Color bgColor;
  final Color? bgTextColor;
  OnBoardingModal({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.bgColor,
    this.bgTextColor,
  });
}
