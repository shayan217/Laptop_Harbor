import 'package:flutter/material.dart';
import 'package:lhstore/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:lhstore/common/widgets/custom_shapes/containers/secondary_header_container.dart';
import 'package:lhstore/common/widgets/text/section_header.dart';
import 'package:lhstore/features/shop/screens/search.dart';
import 'package:lhstore/features/shop/screens/store/widget/Categories_store.dart';
import 'package:lhstore/features/shop/screens/store/widget/outlinedButtonStore.dart';
import 'package:lhstore/features/shop/screens/store/widget/store_appbar.dart';
import 'package:lhstore/features/shop/screens/store/widget/store_brands.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/constants/sizes.dart';
import 'package:lhstore/utils/helpers/helpers_fuctions.dart';
import 'package:page_transition/page_transition.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final dark = LHHelperFunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            LHSecondaryHeaderContainer(
              child: Column(
                children: [
                  LHStoreAppBar(),
                  SizedBox(
                    height: LHSize.spaceBtwSections,
                  ),
                  LHSearchContainer(
                    text: 'Search',
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.bottomToTop,
                              child: LHSearchScreen()));
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(LHSize.defaultSpace),
              child: Column(
                children: [
                  LHSectionHeading(
                    title: 'Top Searches',
                    showActionButton: false,
                    textColor: dark ? LHColor.accent : LHColor.secondary,
                  ),
                  SizedBox(
                    height: LHSize.spaceBtwItems,
                  ),
                  OutlinedButtonStore(),
                  SizedBox(
                    height: LHSize.spaceBtwSections,
                  ),
                  LHSectionHeading(
                    title: 'Categories',
                    showActionButton: true,
                    textColor: dark ? LHColor.accent : LHColor.secondary,
                  ),
                  SizedBox(
                    height: LHSize.spaceBtwItems,
                  ),
                  CategoriesStore(),
                  SizedBox(
                    height: LHSize.spaceBtwSections,
                  ),
                  LHSectionHeading(
                    title: 'Brands',
                    showActionButton: false,
                    textColor: dark ? LHColor.accent : LHColor.secondary,
                  ),
                  SizedBox(
                    height: LHSize.spaceBtwItems,
                  ),
                  LHStoreBrands(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
