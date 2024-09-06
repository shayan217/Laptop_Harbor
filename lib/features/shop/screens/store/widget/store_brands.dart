import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lhstore/features/shop/screens/card/brand_card.dart';
import 'package:lhstore/features/shop/screens/store/widget/verticle_image_brand.dart';
import 'package:lhstore/features/shop/models/firebase_service.dart';

class LHStoreBrands extends StatelessWidget {
  const LHStoreBrands({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DocumentSnapshot>>(
      future: fetchCategories(), // Use your fetchBrands function here
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // You can replace this with a loading indicator or Shimmer effect
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<DocumentSnapshot> categories = snapshot.data!.toList();

          return SizedBox(
            height: 80,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                var category = categories[index];
                var image = category['Image'];
                var title = category['Name'];

                return LHVerticalBrand(
                  image: image,
                  title: title,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BrandCardscreen(categoryId: category.id),
                      ),
                    );
                  },
                );
              },
            ),
          );
        }
      },
    );
  }
}
