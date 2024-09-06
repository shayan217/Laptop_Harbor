import 'package:flutter/material.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/constants/image_strings.dart';
import 'package:lhstore/utils/constants/sizes.dart';

class CategoriesStore extends StatelessWidget {
  const CategoriesStore({Key? key});

  Widget buildContainer(BuildContext context, String title, String imagePath) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        color: LHColor.grey,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium!.apply(color: LHColor.darkGrey),
          ),
          Image.asset(
            imagePath,
            height: 100.0,
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildContainer(context, "Laptops", LHImages.cate1),
              buildContainer(context, "Air Buds", LHImages.cate2),
            ],
          ),
          SizedBox(
            height: LHSize.sm,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildContainer(context, "PC Screens", LHImages.cate3),
              buildContainer(context, "PC", LHImages.cate4),
            ],
          ),
        ],
      ),
    );
  }
}
