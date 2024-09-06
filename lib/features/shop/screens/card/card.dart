import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lhstore/features/shop/screens/card/circular_icon.dart';
import 'package:lhstore/features/shop/screens/card/product_title_text.dart';
import 'package:lhstore/features/shop/screens/card/rounded_container.dart';
import 'package:lhstore/features/shop/screens/card/rounded_image.dart';
import 'package:lhstore/features/shop/screens/card/shadows.dart';
import 'package:lhstore/features/shop/screens/product/product_detail.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/helpers/Loading_page.dart';
import 'package:lhstore/utils/helpers/helpers_fuctions.dart';

class Cardscreen extends StatelessWidget {
  const Cardscreen({
    super.key,
  });
  Future<List<QueryDocumentSnapshot>> fetchProduct() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Products').get();

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
            return LoadingPage();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text('No products found.');
          } else {
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
                  title: Text("Products"),
                ),
                body: GestureDetector(
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
                                    sold:  snapshot.data![index]['sold'],
                                    storage: snapshot.data![index]['storage'],
                                    title: snapshot.data![index]['title']),
                              )),
                          child: Card(
                            title: snapshot.data![index]['title'],
                            imageurl: snapshot.data![index]['Image1'],
                            brand: snapshot.data![index]['brand'],
                            sold: snapshot.data![index]['sold'],
                            price: snapshot.data![index]['price'],
                            ratingtext: snapshot.data![index]['rating'],
                          ),
                        ),
                      ),
                    ),
                  ),
                ));
          }
        });
  }
}

class Card extends StatelessWidget {
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
  // final String ?Image1;
  // final String ?Image2;
  // final String ?Image3;
  // final String ?Image4;
  // final String ?color;
  // final String ?description;
  // final String ?rating;
  // final int ?storage;

  const Card({
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
  });

  @override
  Widget build(BuildContext context) {
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
                  imageUrl: imageurl,
                  applyImageRadius: true,
                  backgroundColor:
                      dark ? LHColor.dark : LHColor.primaryBackground,
                  width: 200,
                  height: 200,
                ),

                /// Sale Tag
                Positioned(
                  top: 12,
                  left: 6,
                  child: RoundedContainer(
                    radius: 8,
                    backgroundColor: LHColor.primary1.withOpacity(0.8),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(
                      "25%",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: Colors.black),
                    ),
                  ),
                ),

                /// Favorite Icon Button
                Positioned(
                    top: 0,
                    right: 0,
                    child: CircularIcon(
                      onPressed: () {},
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ))
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
                  title: title,
                  smallSize: true,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      "⭐ $ratingtext | Solds $sold",
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
                      brand,
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
                    Text('\$$price',
                        maxLines: maxLines,
                        overflow: TextOverflow.ellipsis,
                        style: isLarge
                            ? TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold)
                                .apply(
                                    decoration: lineThrough
                                        ? TextDecoration.lineThrough
                                        : null)
                            : TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)
                                .apply(
                                    decoration: lineThrough
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
