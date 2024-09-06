import 'package:flutter/material.dart';
import 'package:lhstore/features/shop/controllers/cart_controller.dart';
import 'package:lhstore/features/shop/screens/checkout_payment/checkout_overview/checkout_all_content.dart';
import 'package:lhstore/utils/constants/colors.dart';

import 'package:lhstore/utils/helpers/helpers_fuctions.dart';

class Checkout extends StatelessWidget {
    final List<ProductModel> cartItems;

  const Checkout({Key? key, required this.cartItems}) : super(key: key);

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
              Navigator.of(context).pop();
            },
          ),
          title: Text('Checkout'),
        ),
        body: SingleChildScrollView(
          child: checkout_all_content(
            cartItems: cartItems,
          ),
        ));
  }
}
