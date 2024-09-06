import 'package:flutter/material.dart';
import 'package:lhstore/features/shop/screens/profile/profile_update/profile_widget/profile_overview.dart';
import 'package:lhstore/utils/helpers/helpers_fuctions.dart';

class ProfileUpdate extends StatelessWidget {
  const ProfileUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = LHHelperFunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Profile_overview(dark: dark),
      ),
    );
  }
}