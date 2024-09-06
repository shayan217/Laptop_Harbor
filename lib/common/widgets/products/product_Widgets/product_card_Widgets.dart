// product_card_widgets.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lhstore/common/widgets/products/products_cart/product_cart_verticle.dart';
import 'package:lhstore/features/shop/screens/product/product_detail.dart';
 

class ProductCardWidgets extends StatelessWidget {
  Future<List<QueryDocumentSnapshot>> fetchProduct() async {
    QuerySnapshot querySnapshot =
            await FirebaseFirestore.instance.collection('Products').orderBy('price', descending: true).limit(7).get();

        // await FirebaseFirestore.instance.collection('Products').get();

    return querySnapshot.docs;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchProduct(),
      builder: (context, AsyncSnapshot<List<QueryDocumentSnapshot>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text(""); 
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No products found.');
        } else {
          return Row(
            children: snapshot.data!.take(7).map((doc) {
              String productId = doc.id;  

              return GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetail(
                  Image1: doc['Image1'],
                  Image2: doc['Image2'],
                  Image3: doc['Image3'],
                  Image4: doc['Image4'],
                  brand: doc['brand'],
                  color: doc['color'],
                  description: doc['description'],
                  price: doc['price'],
                  rating: doc['rating'],
                  sold: doc['sold'],
                  storage: doc['storage'],
                  title: doc['title'],
                ))),
                child: ProductCart(
                  imageUrl: doc['Image1'],
                  description: doc['title'],
                  price: doc['price'],
                  ratingtext: "⭐ ${doc['rating']} | ${doc['sold']} sold",
                  productId: productId,  
                ),
              );
            }).toList(),
          );
        }
      },
    );
  }
}
