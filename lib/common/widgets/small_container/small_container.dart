import 'package:flutter/material.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/helpers/helpers_fuctions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shimmer/shimmer.dart';

class SmallContainersSection extends StatelessWidget {
  Future<List<DocumentSnapshot>> fetchBrands() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Brands').get();

    return querySnapshot.docs;
  }

  @override
  Widget build(BuildContext context) {
    final dark = LHHelperFunction.isDarkMode(context);

    Widget buildItemContainer(String imagePath, String labelText) {
      return Column(
        children: [
          Container(
            width: 55,
            height: 55,
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: dark ? LHColor.dark : LHColor.light,
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(imagePath), // Assuming imagePath is a URL
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 4),
          Text(
            labelText,
            style: TextStyle(
              fontSize: 12,
              color: dark ? LHColor.accent : LHColor.secondary,
            ),
          ),
        ],
      );
    }

    Widget buildShimmerContainer() {
  return Shimmer.fromColors(
    baseColor: dark ? LHColor.dark : LHColor.light,
    highlightColor: dark ? Color.fromARGB(255, 75, 75, 75) : Color.fromARGB(255, 212, 210, 210),
    period: Duration(seconds: 5), // Set the duration to 2 seconds
    child: Column(
      children: [
        Container(
          width: 55,
          height: 55,
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: dark ? LHColor.dark : LHColor.light,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        SizedBox(height: 4),
        Container(
          width: 55,
          height: 12,
          color: dark ? LHColor.accent : LHColor.secondary,
        ),
      ],
    ),
  );
}


    return Padding(
      padding: EdgeInsets.only(right: 5),
      child: FutureBuilder<List<DocumentSnapshot>>(
        future: fetchBrands(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var _ in List.generate(4, (index) => index))
                  buildShimmerContainer(),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<DocumentSnapshot> brands = snapshot.data!;

            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (var brand in brands.take(4))
                      buildItemContainer(
                        brand['Image'], // Replace 'imagePath' with your actual field name
                        brand['Name'], // Replace 'labelText' with your actual field name
                      ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (var brand in brands.skip(4).take(4))
                      buildItemContainer(
                        brand['Image'], // Replace 'imagePath' with your actual field name
                        brand['Name'], // Replace 'labelText' with your actual field name
                      ),
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
