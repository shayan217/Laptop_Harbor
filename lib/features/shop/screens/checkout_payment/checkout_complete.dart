import 'package:flutter/material.dart';
import 'package:lhstore/features/shop/screens/checkout_payment/checkout_complete/checkout_complete.dart';


import 'package:lhstore/utils/constants/colors.dart';


class CheckoutComplete extends StatelessWidget {
  const CheckoutComplete({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: LHColor.secondary,
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: checkout_complete_widget(height: height),
      ),
    );
  }
}