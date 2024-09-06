import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lhstore/features/shop/screens/profile/widget/profile_list_tile.dart';

class LHProfileScreen extends StatelessWidget {
  const LHProfileScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Disable the back arrow
        title: Row(
          children: [
            Text('Profile'),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Iconsax.notification),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Profile_list_title(),
    );
  }

  
}

