import 'package:flutter/material.dart';
import 'package:lhstore/features/shop/screens/card/circular_icon.dart';
import 'package:lhstore/features/shop/screens/card/product_price_text.dart';
import 'package:lhstore/features/shop/screens/card/product_title_text.dart';
import 'package:lhstore/features/shop/screens/card/rounded_container.dart';
import 'package:lhstore/features/shop/screens/card/rounded_image.dart';
import 'package:lhstore/features/shop/screens/card/shadows.dart';
import 'package:lhstore/utils/constants/image_strings.dart';


class VeriticalCardscreen extends StatelessWidget {
  const VeriticalCardscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
      onTap: (){},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [ShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Column(
          children: [
            /// Thumbnail, Wishlist Button, Discount Tag
            RoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(8),
              backgroundColor: const Color(0xFFF6F6F6),
              child: Stack(
                children: [
                  /// Thumbnail Image
                  const RoundedImage(imageUrl: LHImages.ProductImage1, applyImageRadius: true,),
    
                  /// Sale Tag
                  Positioned(
                    top: 12,
                    left: 6,
                    child: RoundedContainer(
                      radius: 8,
                      backgroundColor: const Color(0xFFFFE24B).withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: Text("25%", style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.black),),
                    ),
                  ),
    
                  /// Favorite Icon Button
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: CircularIcon(icon: Icons.favorite, color: Colors.red,)
                  )
                ],
              ),
            ),
    
            const SizedBox(height: 8,),
    
            /// Details
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProductTitleText(title: "Green Nike Air Shoes", smallSize: true,),
                  const  SizedBox(height: 8,),
                  const  Row(
                    children: [
                      Text("Nike", overflow: TextOverflow.ellipsis, maxLines: 1, style: TextStyle(fontSize: 12, color: Colors.grey),),
                      SizedBox(width: 4,),
                      Icon(Icons.verified, color: Colors.blue, size: 12,)
                    ],
                  ),
    
                  // Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Price
                      ProductPriceText(price: '35.0',),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomRight: Radius.circular(16)
                          )
                        ),
                        child: const SizedBox(
                          width: 38.4,
                          height: 38.4,
                          child: Center(child: Icon(Icons.add, color: Colors.white,))
                        ),
                      )
                    ],
                  )                
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