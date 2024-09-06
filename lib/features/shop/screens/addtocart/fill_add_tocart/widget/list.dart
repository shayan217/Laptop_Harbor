import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lhstore/features/shop/controllers/cart_controller.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/helpers/customSnakbar.dart';

class Filladdtocart extends StatefulWidget {
  const Filladdtocart({
    Key? key,
    required this.image,
    required this.heading,
    required this.subtitle,
    required this.price,
    required this.onIcon1Pressed, // Remove from Cart button
    required this.onIcon2Pressed, // Increase quantity button
    required this.cartController,
    required this.removeCart,
  }) : super(key: key);

  final String image;
  final String heading;
  final String subtitle;
  final String price;
  final VoidCallback onIcon1Pressed;
  final VoidCallback onIcon2Pressed;
  final VoidCallback removeCart;
  final CartController cartController;

  @override
  State<Filladdtocart> createState() => _FilladdtocartState();
}

class _FilladdtocartState extends State<Filladdtocart> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        margin: EdgeInsets.all(8.0),
        child: ListTile(
          leading: Image.network(widget.image, width: 50, height: 200),
          title: Text(widget.heading),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.subtitle),
              Text(
                '\$${widget.price}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          trailing: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    

                    IconButton(
                      icon: Icon(
                        Iconsax.minus_square4,
                        color: LHColor.primary1,
                      ),
                      onPressed: widget.onIcon2Pressed
                    ),
                    Text(
                      '${widget.cartController.cartItems.firstWhere((item) => item.image == widget.image).quantity}',
                      style: TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      icon: Icon(
                        Iconsax.add_square,
                        color: LHColor.primary1,
                      ),
                      onPressed: widget.onIcon1Pressed
                    ),
                    
                    IconButton(
                      icon: Icon(
                        Iconsax.trash,
                        color: LHColor.primary1,
                      ),
                      onPressed: () {
                        // Show a Cupertino-style confirmation dialog
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CupertinoAlertDialog(
                              title: Text('Confirmation'),
                              content: Text(
                                  'Are you sure you want to delete this item?'),
                              actions: [
                                CupertinoDialogAction(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Close the dialog
                                  },
                                  child: Text('No'),
                                ),
                                CupertinoDialogAction(
                                  onPressed: () {
                                    // Delete the item and close the dialog
                                    widget.removeCart();

                                    // Show a snackbar
                                    LHLoader.successSnackBar(
                                        title: '🎉 Congratulations',
                                        message: 'One Item has been removed.');

                                    Navigator.of(context)
                                        .pop(); // Close the dialog
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

