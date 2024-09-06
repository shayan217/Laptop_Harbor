
import 'package:flutter/material.dart';

class ProductPriceText extends StatelessWidget {
  const ProductPriceText({
    super.key,
    this.currencySign = '\$',
    required this.price,
    this.isLarge = false,
    this.maxLines = 1,
    this.lineThrough = false,
  });

  final String currencySign, price;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    return  Text(
      currencySign + price,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: isLarge 
        ?  TextStyle(fontSize: 24, fontWeight: FontWeight.bold).apply(decoration: lineThrough ? TextDecoration.lineThrough : null)
        :  TextStyle(fontSize: 14, fontWeight: FontWeight.bold).apply(decoration: lineThrough ? TextDecoration.lineThrough : null)
    );
  }
}
