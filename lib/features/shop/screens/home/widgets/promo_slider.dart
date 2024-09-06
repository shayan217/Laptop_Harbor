import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lhstore/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:lhstore/common/widgets/images/LH_images_rounded.dart';
import 'package:lhstore/features/shop/controllers/home_controller.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/constants/sizes.dart';


class LHPromoSlider extends StatelessWidget {
  const LHPromoSlider({
    super.key, required this.banners,
  });
  
  
   final List<String> banners;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(autoPlay: true, viewportFraction: 1, onPageChanged: (index, _) => controller.updatePageIndicator(index),
            height: 150,
          ),
          items: banners.map((url) => LHRoundedimage(imageUrl: url)).toList(),
        ),
        SizedBox(height: LHSize.spaceBtwItems,),
        Center(
          child: Obx(
            ()=> Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for(int i = 0; i < banners.length; i ++)
                LHcircularContainer(
                  width: 15,
                  height: 4,
                  margin: EdgeInsets.only(right: 10),
                  backgroundColor: controller.carousalCurrentIndex.value == i ? LHColor.dark : LHColor.grey, size: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}