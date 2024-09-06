import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lhstore/features/shop/screens/wishlist/wishlist_provider.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/helpers/customSnakbar.dart';
import 'package:lhstore/utils/helpers/helpers_fuctions.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ProductCart extends StatefulWidget {
  final String imageUrl;
  final String description;
  final int price;
  final String ratingtext;
  final String productId;

  const ProductCart({
    Key? key,
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.ratingtext,
    required this.productId,
  }) : super(key: key);

  @override
  _ProductCartState createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  bool isFavorite = false;
  bool showShimmer = true;

  @override
  void initState() {
    super.initState();

    // Simulate loading by delaying the appearance of the original card
    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          showShimmer = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final wishlistProvider =
        Provider.of<WishlistProvider>(context, listen: false);
    final dark = LHHelperFunction.isDarkMode(context);

    return Card(
      elevation: 4,
      child: SizedBox(
        width: 210,
        child: Stack(
          children: [
            if (showShimmer)
              ShimmerCard() // Shimmer effect widget
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    color: dark ? LHColor.grey : LHColor.softGrey,
                    height: 130,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.network(
                        widget.imageUrl,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    color: dark ? LHColor.dark : LHColor.light,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            widget.description,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$${widget.price}',
                                style: TextStyle(
                                  color: LHColor.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(widget.ratingtext),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            Positioned(
              top: 5,
              right: 5,
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
                child: Icon(
                  isFavorite ? Iconsax.heart5 : Iconsax.heart,
                  color: Colors.red,
                  size: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShimmerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dark = LHHelperFunction.isDarkMode(context);

    return Shimmer.fromColors(
      baseColor: dark ? LHColor.dark : LHColor.light,
      highlightColor: dark ? Color.fromARGB(255, 75, 75, 75) : Color.fromARGB(255, 212, 210, 210),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: dark ? LHColor.grey : LHColor.softGrey,
            height: 130,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                color: dark ? LHColor.dark : LHColor.light,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            color: dark ? LHColor.dark : LHColor.light,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    color: dark ? LHColor.dark : LHColor.light,
                    height: 16,
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 80,
                        height: 16,
                        color: dark ? LHColor.dark : LHColor.light,
                      ),
                      Container(
                        width: 40,
                        height: 16,
                        color: dark ? LHColor.dark : LHColor.light,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
