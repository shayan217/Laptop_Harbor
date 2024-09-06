import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lhstore/features/shop/screens/wishlist/wishlist_provider.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:lottie/lottie.dart';

class Wishlistscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);

    // Use wishlistProvider.wishlist to get the wishlist items
    List<String> wishlistItems = wishlistProvider.wishlist;

    return Scaffold(
      appBar: AppBar(
        title: Text("Wishlist"),
      ),
      body: wishlistItems.isEmpty
          ? Center(
              // Display Lottie animation when wishlist is empty
              child: Lottie.asset(
                'assets/json/empty.json', // Adjust the path
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
            )
          : GridView.builder(
              itemCount: wishlistItems.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 288,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              itemBuilder: (_, index) {
                // Use FutureBuilder to fetch and display the details of each product
                return FutureBuilder(
                  // Replace this with your logic to fetch product details based on the productId
                  future: fetchProductDetails(wishlistItems[index]),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Shimmer(
                        child: Card(
                          // Customize how each wishlist item card looks
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      "",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '',
                                          style: TextStyle(
                                            color: LHColor.primary,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(""),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        gradient: LHColor.linearGradient1,
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      // Customize how each wishlist item card looks with fetched details
                      return WishlistItemCard(
                        productId: wishlistItems[index],
                        image: snapshot.data!['image'],
                        title: snapshot.data!['title'],
                        price: snapshot.data!['price'],
                        rating: snapshot.data!['rating'],
                        sold: snapshot.data!['sold'],
                      );
                    }
                  },
                );
              },
            ),
    );
  }

  // Replace this with your logic to fetch product details from the database
  Future<Map<String, dynamic>> fetchProductDetails(String productId) async {
    // Example: Fetch product details using Firestore
    // You may need to modify this based on your database structure
    // Replace this with your logic to fetch product details from the database
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('Products')
        .doc(productId)
        .get();

    // Return a Map containing the fetched details
    return {
      'image': snapshot['Image1'],
      'title': snapshot['title'],
      'price': snapshot['price'],
      'rating': snapshot['rating'],
      'sold': snapshot['sold'],
    };
  }
}


class WishlistItemCard extends StatelessWidget {
  final String productId;
  final String image;
  final String title;
  final int price;
  final String rating;
  final int sold;

  const WishlistItemCard({
    Key? key,
    required this.productId,
    required this.image,
    required this.title,
    required this.price,
    required this.rating,
    required this.sold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Customize how each wishlist item card looks with fetched details
    return Card(
      // Customize how each wishlist item card looks
      child: Column(
        children: [
          Image.network(
            image,
            fit: BoxFit.fitHeight,
            height: 130,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${price}',
                      style: TextStyle(
                        color: LHColor.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('⭐ $rating | $sold sold'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
