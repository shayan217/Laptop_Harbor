// lh_brands.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lhstore/common/widgets/text/section_header.dart';
import 'package:lhstore/features/shop/models/firebase_service.dart';
import 'package:lhstore/features/shop/screens/card/brand_card.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/constants/sizes.dart';
import 'package:lhstore/utils/helpers/Loading_page.dart';
import 'package:lhstore/utils/helpers/helpers_fuctions.dart';

class LHBrands extends StatelessWidget {
  const LHBrands({Key? key}) : super(key: key);

  Future<int> fetchItemCount(String categoryId) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Categories')
        .doc(categoryId)
        .collection('two')
        .get();

    return querySnapshot.size;
  }

  @override
  Widget build(BuildContext context) {
    final dark = LHHelperFunction.isDarkMode(context);
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
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 27),
            child: LHSectionHeading(
              title: 'Brands',
              showActionButton: false,
              textColor: dark ? LHColor.accent : LHColor.secondary,
            ),
          ),
          SizedBox(
            height: LHSize.spaceBtwItems,
          ),
          Expanded(
            child: FutureBuilder<List<DocumentSnapshot>>(
              future: fetchCategories(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return LoadingPage();
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  List<DocumentSnapshot> categories = snapshot.data!;

                  return ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      var category = categories[index];
                      var brandImage = category['Image'];
                      var brandName = category['Name'];

                      return FutureBuilder<int>(
                        future: fetchItemCount(category.id),
                        builder: (context, itemCountSnapshot) {
                          if (itemCountSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text("");
                          } else if (itemCountSnapshot.hasError) {
                            return Center(
                              child: Text('Error: ${itemCountSnapshot.error}'),
                            );
                          } else {
                            int itemCount = itemCountSnapshot.data ?? 0;

                            return ListTile(
                              leading: CircleAvatar(
                                radius: 20, // Increase the radius as needed
                                backgroundColor: LHColor.grey,
                                child: ClipOval(
                                  child: Image.network(
                                    brandImage,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              title: Text(brandName),
                              subtitle: Text('$itemCount items'),
                              trailing: Icon(Iconsax.arrow_circle_right),
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
                          }
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
