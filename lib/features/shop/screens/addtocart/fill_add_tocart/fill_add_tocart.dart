import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lhstore/features/shop/controllers/cart_controller.dart';
import 'package:lhstore/features/shop/screens/addtocart/empty_add_tocart/empty_add_tocart.dart';
import 'package:lhstore/features/shop/screens/addtocart/fill_add_tocart/widget/list.dart';
import 'package:lhstore/features/shop/screens/checkout_payment/checkout.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/helpers/customSnakbar.dart';
import 'package:lhstore/utils/helpers/helpers_fuctions.dart';

class Filladd extends StatefulWidget {
  @override
  State<Filladd> createState() => _FilladdState();
}

class _FilladdState extends State<Filladd> {
  late CartController _cartController;

  @override
  void initState() {
    super.initState();
    _cartController = Get.put(CartController());
    print(_cartController.cartItems.length); // Initialize CartController
  }

  @override
  Widget build(BuildContext context) {
    final dark = LHHelperFunction.isDarkMode(context);

    // Check if the cart is empty
    if (_cartController.cartItems.isEmpty) {
      // Render empty cart message
      return Addtocart();
      // return Scaffold(
      //   appBar: AppBar(
      //     leading: IconButton(
      //       icon: Icon(
      //         Icons.arrow_back,
      //         color: dark ? LHColor.light : LHColor.dark,
      //       ),
      //       onPressed: () {
      //         Navigator.pop(context);
      //       },
      //     ),
      //     title: Text('Shopping Cart'),
      //     actions: [
      //       IconButton(
      //         icon: Icon(
      //           Iconsax.empty_wallet_remove,
      //           color: dark ? LHColor.light : LHColor.dark,
      //         ),
      //         onPressed: () {
      //           // Show a snackbar that the cart is already empty
      //           LHLoader.WarningSnackBar(
      //             title: "Warning",
      //             message: "Cart is already empty.",
      //           );
      //         },
      //       ),
      //     ],
      //   ),
      //   body: Center(
      //     child: Text('Your cart is empty.'),
      //   ),
      // );
    } else {
      // Render cart product items
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
          title: Text('Shopping Cart'),
          actions: [
            IconButton(
              icon: Icon(
                Iconsax.empty_wallet_remove,
                color: dark ? LHColor.light : LHColor.dark,
              ),
              onPressed: () {
                // Show a Cupertino-style confirmation dialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                      title: Text('Confirmation'),
                      content: Text('Are you sure you want to delete all items?'),
                      actions: [
                        CupertinoDialogAction(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: Text('No'),
                        ),
                        CupertinoDialogAction(
                          onPressed: () {
                            // Clear the cart and close the dialog
                            _cartController.clearCart();
                            setState(() {});
                            Navigator.of(context).pop();
                            // Show a snackbar after clearing the cart
                            LHLoader.successSnackBar(
                              title: "🎉 Congratulations",
                              message: "All items have been removed.",
                            );
                          },
                          child: Text('Yes'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: _cartController.cartItems.map((product) {
                  return Filladdtocart(
                    image: product.image,
                    heading: product.brand,
                    subtitle: product.title,
                    price: product.price.toString(),
                    onIcon1Pressed: () {
                      // Handle icon 1 press
                      _cartController.incrementQuantity(product);
                      setState(() {
                        
                      });
                    },
                    onIcon2Pressed: () {
                      // Handle icon 2 press
                      _cartController.decrementQuantity(product);
                      setState(() {
                        
                      });
                    },
                    removeCart: () {
                      _cartController.removeFromCart(product);
                      setState(() {});
                    },
                    cartController: _cartController,
                  );
                }).toList(),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Handle checkout logic
      Get.to(Checkout(cartItems: _cartController.cartItems.toList()));
                },
                child: Column(
                  children: [
                    Text('Proceed to Checkout'),
                    SizedBox(height: 10),
                    Obx(() =>
                        Text('\$${_cartController.getTotalPrice().toStringAsFixed(2)}')),
                    // Use Obx to automatically update the total price when it changes
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: LHColor.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  side: BorderSide(color: LHColor.primary),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
