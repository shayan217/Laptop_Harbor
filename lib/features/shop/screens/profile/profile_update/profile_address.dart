import 'package:flutter/material.dart';
import 'package:lhstore/features/shop/screens/profile/profile_update/profile_edit_widget/profile_edit_address.dart';
import 'package:lhstore/utils/helpers/helpers_fuctions.dart';

class ProfileAddressEdit extends StatelessWidget {
  const ProfileAddressEdit({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = LHHelperFunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: profile_edit_address(dark: dark),
      ),
    );
  }
}