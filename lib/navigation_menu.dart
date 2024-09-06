import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lhstore/curved_navigation_bar.dart';
import 'package:lhstore/features/shop/screens/home/home.dart';
import 'package:lhstore/features/shop/screens/profile/profile.dart';
import 'package:lhstore/features/shop/screens/store/store.dart';
import 'package:lhstore/features/shop/screens/wishlist/card/card.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/helpers/helpers_fuctions.dart';
 
class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = LHHelperFunction.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => CurvedNavigationBar(
          items: [
            Icon(Iconsax.home, color: LHColor.light),
            Icon(Iconsax.shop, color: LHColor.light),
            Icon(Iconsax.heart, color: LHColor.light),
            Icon(Iconsax.user, color: LHColor.light),
          ],
          index: controller.selectedIndex.value,
          color: LHColor.primary,
          // buttonBackgroundColor: dark
          //     ? LHColor.white.withOpacity(0.1)
          //     : LHColor.black.withOpacity(0.1),
          backgroundColor: LHColor.primary1,
          onTap: (index) => controller.selectedIndex.value = index,
          letIndexChange: (_) => true,
          animationCurve: Curves.easeOut,
          animationDuration: Duration(milliseconds: 600),
          height: 60,
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    HomeScreen(),
    StoreScreen(),
    Wishlistscreen(),
    LHProfileScreen(),
  ];
}

void main() {
  runApp(
    MaterialApp(
      home: NavigationMenu(),
    ),
  );
}