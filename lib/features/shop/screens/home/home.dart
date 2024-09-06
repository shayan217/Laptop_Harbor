import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lhstore/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:lhstore/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:lhstore/common/widgets/products/product_Widgets/product_card_Widgets.dart';
import 'package:lhstore/common/widgets/small_container/small_container.dart';
import 'package:lhstore/common/widgets/text/section_header.dart';
import 'package:lhstore/features/shop/screens/brands.dart';
import 'package:lhstore/features/shop/screens/card/card.dart';
import 'package:lhstore/features/shop/screens/card/featured_card.dart';
import 'package:lhstore/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:lhstore/features/shop/screens/home/widgets/home_categories.dart';
import 'package:lhstore/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:lhstore/features/shop/screens/search.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/constants/image_strings.dart';
import 'package:lhstore/utils/constants/sizes.dart';
import 'package:lhstore/utils/helpers/helpers_fuctions.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = LHHelperFunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            LHPrimaryHeaderContainer(
                child: Column(
              children: [
                LHHomeAppBar(),
                SizedBox(
                  height: LHSize.spaceBtwSections,
                ),
                LHSearchContainer(
                  text: 'Search in Store',
                  onTap: () {
                    Get.to(LHSearchScreen());
                  },
                ),
                SizedBox(
                  height: LHSize.spaceBtwItems,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: LHSize.defaultSpace, right: LHSize.defaultSpace),
                  child: Column(
                    children: [
                      LHPromoSlider(
                        banners: [
                          LHImages.slider1,
                          LHImages.slider2,
                          LHImages.slider3,
                          LHImages.slider4,
                          LHImages.slider5,
                          LHImages.slider6,
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
            Padding(
                padding: EdgeInsets.all(LHSize.defaultSpace),
                child: Column(
                  children: [
                    LHSectionHeading(
                      title: 'Categories',
                      showActionButton: false,
                      textColor: dark ? LHColor.accent : LHColor.secondary,
                    ),
                    SizedBox(
                      height: LHSize.spaceBtwItems,
                    ),
                    SmallContainersSection(),
           
                    SizedBox(
                      height: LHSize.spaceBtwSections,
                    ),
                    LHSectionHeading(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.bottomToTop,
                                child: LHBrands()));
                      },
                      title: 'Popular Brands',
                      showActionButton: true,
                      textColor: dark ? LHColor.accent : LHColor.secondary,
                    ),
                    SizedBox(
                      height: LHSize.spaceBtwItems,
                    ),
                    LHHomeCategories(),
                    SizedBox(
                      height: LHSize.spaceBtwItems,
                    ),
                    LHSectionHeading(
                      title: 'Popular Laptops',
                      textColor: dark ? LHColor.accent : LHColor.secondary,
                      showActionButton: true,
                      onPressed: () {
                        Get.to(Cardscreen());
                      },
                    ),
                    SizedBox(
                      height: LHSize.spaceBtwItems,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ProductCardWidgets(),
                    ),
                      SizedBox(
                      height: LHSize.spaceBtwItems,
                    ),
                    LHSectionHeading(
                      title: 'Featured Laptops',
                      textColor: dark ? LHColor.accent : LHColor.secondary,
                      showActionButton: true,
                      onPressed: () {
                        Get.to(Cardscreen());
                      },
                    ),
                    SizedBox(
                      height: LHSize.spaceBtwItems,
                    ),
                    FeaturedCardscreen(),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
