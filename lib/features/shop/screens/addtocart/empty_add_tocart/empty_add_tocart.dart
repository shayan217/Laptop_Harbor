import 'package:flutter/material.dart';
import 'package:lhstore/features/shop/screens/addtocart/empty_add_tocart/widget/button.dart';
import 'package:lhstore/features/shop/screens/addtocart/empty_add_tocart/widget/list_tile.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/constants/sizes.dart';
import 'package:lhstore/utils/helpers/helpers_fuctions.dart';
import 'package:lottie/lottie.dart';

class Addtocart extends StatelessWidget {
  const Addtocart({Key? key});

  @override
  Widget build(BuildContext context) {
    final dark = LHHelperFunction.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: dark ? LHColor.light : LHColor.dark,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('My Cart'), // Your custom title
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              "assets/json/addtocart.json",
              height: 100.0,
              width: 100.0,
            ),
            SizedBox(height: 16),
            Text(
              'Your Cart is Empty',
              style: TextStyle(
                fontSize: LHSize.lg,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            CartButton(
              buttonTitle: "Start Browsing",
              onTap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 16),
            listtile(),
            SizedBox(height: 45),
          ],
        ),
      ),
    );
  }
}
