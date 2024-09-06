import 'package:flutter/material.dart';
import 'package:lhstore/features/shop/screens/profile/profile_update/profile_edit_widget/profile_phone_edit.dart';
import 'package:lhstore/utils/helpers/helpers_fuctions.dart';

class ProfilePhoneEdit extends StatelessWidget {
  const ProfilePhoneEdit({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = LHHelperFunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: profile_edit_phone(dark: dark),
      ),
    );
  }
}