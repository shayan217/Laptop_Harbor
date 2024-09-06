import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lhstore/features/shop/controllers/cart_controller.dart';

class LHCounterIcon extends StatefulWidget {
  const LHCounterIcon({
    super.key,
    required this.onPressed, required this.iconColor,
  });
  final Color iconColor;
  final VoidCallback onPressed;

  @override
  State<LHCounterIcon> createState() => _LHCounterIconState();
}

class _LHCounterIconState extends State<LHCounterIcon> {
  final CartController _cartController = CartController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: widget.onPressed,
          icon: Icon(
            Iconsax.shopping_bag,
            color: widget.iconColor,
          ),
        ),
        
      ],
    );
  }
}
