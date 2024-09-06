import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lhstore/features/shop/screens/card/circular_icon.dart';
import 'package:lhstore/features/shop/screens/card/product_title_text.dart';
import 'package:lhstore/features/shop/screens/card/rounded_container.dart';
import 'package:lhstore/features/shop/screens/card/rounded_image.dart';
import 'package:lhstore/features/shop/screens/card/shadows.dart';
import 'package:lhstore/features/shop/screens/product/product_detail.dart';
import 'package:lhstore/features/shop/screens/wishlist/wishlist_provider.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/helpers/customSnakbar.dart';
import 'package:lhstore/utils/helpers/helpers_fuctions.dart';
import 'package:provider/provider.dart';

class FeaturedCardscreen extends StatelessWidget {
  const FeaturedCardscreen({
    super.key,
  });
  Future<List<QueryDocumentSnapshot>> fetchProduct() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Products')
        .orderBy('brand', descending: true)
        .limit(4)
        .get();

    return querySnapshot.docs;
  }

  @override
  Widget build(BuildContext context) {
    final dark = LHHelperFunction.isDarkMode(context);
    return FutureBuilder(
        future: fetchProduct(),
        builder:
            (context, AsyncSnapshot<List<QueryDocumentSnapshot>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("");
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text('No products found.');
          } else {
            return GestureDetector(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: GridView.builder(
                    itemCount: snapshot.data!.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 288,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                    ),
                    itemBuilder: (_, index) => GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetail(
                            Image1: snapshot.data![index]['Image1'],
                            Image2: snapshot.data![index]['Image2'],
                            Image3: snapshot.data![index]['Image3'],
                            Image4: snapshot.data![index]['Image4'],
                            brand: snapshot.data![index]['brand'],
                            color: snapshot.data![index]['color'],
                            description: snapshot.data![index]['description'],
                            price: snapshot.data![index]['price'],
                            rating: snapshot.data![index]['rating'],
                            sold: snapshot.data![index]['sold'],
                            storage: snapshot.data![index]['storage'],
                            title: snapshot.data![index]['title'],
                          ),
                        ),
                      ),
                      child: FeaturedCard(
                        title: snapshot.data![index]['title'],
                        imageurl: snapshot.data![index]['Image1'],
                        brand: snapshot.data![index]['brand'],
                        sold: snapshot.data![index]['sold'],
                        price: snapshot.data![index]['price'],
                        ratingtext: snapshot.data![index]['rating'],
                        productId: snapshot.data![index]
                            .id, // Pass the productId from the loop
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        });
  }
}

class FeaturedCard extends StatefulWidget {
  final String imageurl;
  final String title;
  final int sold;
  final int price;
  final String brand;
  final String ratingtext;
  final String currencySign;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;
  final String productId;

  // final String ?Image1;
  // final String ?Image2;
  // final String ?Image3;
  // final String ?Image4;
  // final String ?color;
  // final String ?description;
  // final String ?rating;
  // final int ?storage;

  const FeaturedCard({
    super.key,
    // this.Image1,
    // this.Image2,
    // this.Image3,
    // this.Image4,
    // this.color,
    // this.description,
    // this.rating,
    // this.storage,

    required this.imageurl,
    required this.sold,
    required this.brand,
    required this.title,
    required this.price,
    required this.ratingtext,
    this.currencySign = '\$',
    this.isLarge = false,
    this.maxLines = 1,
    this.lineThrough = false,
    required this.productId,
  });

  @override
  State<FeaturedCard> createState() => _FeaturedCardState();
}

class _FeaturedCardState extends State<FeaturedCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final wishlistProvider =
        Provider.of<WishlistProvider>(context, listen: false);
    final dark = LHHelperFunction.isDarkMode(context);
    return Container(
      width: 180,
      height: 280,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: [ShadowStyle.verticalProductShadow],
        borderRadius: BorderRadius.circular(16),
        color: dark ? LHColor.dark : LHColor.primaryBackground,
      ),
      child: Column(
        children: [
          /// Thumbnail, Wishlist Button, Discount Tag
          RoundedContainer(
            height: 150,
            padding: const EdgeInsets.all(8),
            backgroundColor: dark ? LHColor.darkerGrey : LHColor.light,
            child: Stack(
              children: [
                /// Thumbnail Image
                RoundedImage(
                  imageUrl: widget.imageurl,
                  applyImageRadius: true,
                  backgroundColor:
                      dark ? LHColor.dark : LHColor.primaryBackground,
                  width: 200,
                  height: 200,
                ),

                /// Sale Tag
                Positioned(
                  top: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });

                      if (isFavorite) {
                        // Check if the item is already in the wishlist
                        if (!wishlistProvider.isInWishlist(widget.productId)) {
                          wishlistProvider.addToWishlist(widget.productId);
                          // Dikhaaye Snackbar
                          LHLoader.success1SnackBar(
                            title: "🎉 Congratulations",
                            message: "Item has been added",
                          );
                        } else {
                          // Item is already in the wishlist, show a different Snackbar
                          LHLoader.WarningSnackBar(
                            title: "⚠️ Warning",
                            message: "Item is already in the wishlist",
                          );
                        }
                      } else {
                        wishlistProvider.removeFromWishlist(widget.productId);
                        // Dikhaaye Snackbar
                        LHLoader.success1SnackBar(
                          title: "🎉 Congratulations",
                          message: "Item has been removed",
                        );
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                            .withOpacity(0.9), // Change color as needed
                      ),
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        isFavorite ? Iconsax.heart5 : Iconsax.heart,
                        color: Colors.red,
                        size: 24,
                      ),
                    ),
                  ),
                ),

                /// Favorite Icon Button
              ],
            ),
          ),

          const SizedBox(
            height: 8,
          ),

          /// Details
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductTitleText(
                  title: widget.title,
                  smallSize: true,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      "⭐ ${widget.ratingtext} | Solds ${widget.sold}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      widget.brand,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Iconsax.verify5,
                      color: Colors.blue,
                      size: 12,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // ProductPriceText(
                    //   price: '\100',
                    // ),
                    Text('\$${widget.price}',
                        maxLines: widget.maxLines,
                        overflow: TextOverflow.ellipsis,
                        style: widget.isLarge
                            ? TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold)
                                .apply(
                                    decoration: widget.lineThrough
                                        ? TextDecoration.lineThrough
                                        : null)
                            : TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)
                                .apply(
                                    decoration: widget.lineThrough
                                        ? TextDecoration.lineThrough
                                        : null)),
                    Padding(
                      padding: const EdgeInsets.only(top: 13),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: LHColor.primary,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomRight: Radius.circular(16))),
                        child: SizedBox(
                            width: 38.4,
                            height: 38.4,
                            child: Center(
                                child: Icon(
                              Iconsax.element_plus,
                              color: LHColor.light,
                            ))),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
