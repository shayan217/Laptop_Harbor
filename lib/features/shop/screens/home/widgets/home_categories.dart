import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lhstore/common/widgets/image_text_widget/verticle_image_text.dart';
import 'package:lhstore/features/shop/models/firebase_service.dart';
import 'package:lhstore/features/shop/screens/card/brand_card.dart';
import 'package:lhstore/utils/helpers/shimmer.dart';

class LHHomeCategories extends StatelessWidget {
  const LHHomeCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DocumentSnapshot>>(
      future: fetchCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LHShimmerEffect(height: 20, width: 20);
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<DocumentSnapshot> categories = snapshot.data!.take(6).toList();

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

                return LHVerticalImageText(
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
