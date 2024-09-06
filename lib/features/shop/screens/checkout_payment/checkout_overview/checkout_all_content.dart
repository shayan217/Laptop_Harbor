import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lhstore/features/personlization/controllers/user_controller.dart';
import 'package:lhstore/features/shop/controllers/cart_controller.dart';
import 'package:lhstore/features/shop/screens/address/address.dart';
import 'package:lhstore/features/shop/screens/checkout_payment/checkout_complete.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/constants/sizes.dart';

class checkout_all_content extends StatefulWidget {
  final List<ProductModel> cartItems;
  const checkout_all_content({
    required this.cartItems,
    super.key,
  });

  @override
  State<checkout_all_content> createState() => _checkout_all_contentState();
}

class _checkout_all_contentState extends State<checkout_all_content> {
  late CartController _cartController;
  @override
  void initState() {
    super.initState();
    _cartController = Get.put(CartController());
    print(_cartController.cartItems.length); // Initialize CartController
  }
  Future<void> storeOrderData() async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        final orderData = {
          'userId': user.uid,
          'timestamp': FieldValue.serverTimestamp(),
          'products': widget.cartItems.map((product) => {
            'image': product.image,
            'brand': product.brand,
            'title': product.title,
            'price': product.price,
            'quantity': product.quantity,
          }).toList(),
          'subtotal': _cartController.getTotalPrice(),
          'shippingFee': 85,
          'taxFee': 100,
          'total': _cartController.getTotalPrice() + 85 + 100,
        };

        await FirebaseFirestore.instance.collection('myorders').add(orderData);

        // Clear the cart after storing the order
        _cartController.clearCart();

        // Navigate to the CheckoutComplete screen or any other screen as needed
        Get.to(CheckoutComplete());
      }
    } catch (error) {
      print('Error storing order data: $error');
      // Handle error, show a message to the user, or perform any other action
    }
  }

  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Column(
      children: [
        for (var product in widget.cartItems)
          Card(
            // Set the width of the Card
            margin: EdgeInsets.fromLTRB(
                16.0, 0.0, 16.0, 16.0), // Adjust the margin as needed
            child: Row(
              children: [
                // Left side: small image
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    product.image,
                    width: 50,
                    height: 50,
                  ),
                ),
                // Right side: Column with sub-title, title, and additional title
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize:
                          MainAxisSize.min, // Set the mainAxisSize to min
                      children: [
                        // Row with icon and "Beats" text
                        Row(
                          children: [
                            Text(
                              product.brand,
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(width: 3),
                            Icon(
                              Iconsax
                                  .verify5, // You can change the icon as needed
                              color: Colors.blue,
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          product.title,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'price: ${product.price}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Quantity: ${product.quantity}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        Card(
          // Set the width of the Card
          margin: EdgeInsets.fromLTRB(
            16.0,
            0.0,
            16.0,
            16.0,
          ), // Adjust the margin as needed
          child: Row(
            children: [
              // Left side: small image

              // Right side: Column with sub-title, title, and additional title
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize:
                        MainAxisSize.min, // Set the mainAxisSize to min
                    children: [
                      // Row with icon and "Subtotal" text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Subtotal',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          // Additional text to the right of "Subtotal"
                          // Obx(
                          //   ()=> Text(

                          //     style: TextStyle(
                          //         fontSize: 18, fontWeight: FontWeight.bold),
                          //   ),
                          // ),
                          Obx(() => Text(
                                '\$${_cartController.getTotalPrice().toStringAsFixed(2)}',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                      SizedBox(height: 4),

                      // Row with icon and "Shipping Fee" text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Shipping Fee',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          // Additional text to the right of "Shipping Fee"
                          Text(
                            '\$85',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),

                      // Row with icon and "Tax Fee" text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tax Fee',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          // Additional text to the right of "Tax Fee"
                          Text(
                            '\$100',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Order Total',
                            style: TextStyle(
                                fontSize: 21, fontWeight: FontWeight.bold),
                          ),
                          // Additional text to the right of "Tax Fee"
                          Obx(
                            () => Text(
                              '\$${(_cartController.getTotalPrice() + 85 + 100).toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(
                        height: 50,
                      ),
                      SizedBox(
                        height: LHSize.spaceBtwItems,
                      ),

                      Text(
                        "Payment Method",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 17),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/slider/paypal.png', // Replace with your actual image path
                            width: 40, // Adjust the width as needed
                            height: 40, // Adjust the height as needed
                          ),
                          SizedBox(
                            width: 22,
                          ),
                          Text(
                            "Paypal",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: LHSize.spaceBtwSections,
                      ),
                      Row(
                        children: [
                          Text(
                            "Shipping Address",
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(
                              Iconsax.edit,
                              color: LHColor.primary1,
                            ),
                            onPressed: () {
                              Get.to(AddressScreen());
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: LHSize.spaceBtwInputFields,
                      ),
                      Row(
                        children: [
                          Icon(
                            Iconsax.call,
                            size: 14,
                          ),
                          SizedBox(
                            width: 9,
                          ),
                          Text(
                            controller.user.value.phoneNumber,
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Iconsax.location,
                            size: 14,
                          ),
                          SizedBox(
                            width: 9,
                          ),
                          Expanded(
                            // Allow text to take up the available space
                            child: Text(
                            controller.user.value.address,

                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 380, // Set your desired width
          child: ElevatedButton(
            onPressed: () async {
              await storeOrderData();
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(LHColor.primary),
              side: MaterialStateProperty.all<BorderSide>(
                  BorderSide(color: LHColor.primary)),
            ),
            child: Obx(
              () => Text(
                'Checkout \$${(_cartController.getTotalPrice() + 85 + 100).toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: LHSize.spaceBtwSections,
        )
      ],
    );
  }
}
