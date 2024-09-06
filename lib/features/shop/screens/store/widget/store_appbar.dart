import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lhstore/common/widgets/appbar/appbar.dart';
import 'package:lhstore/common/widgets/product_cart/cart_menu_icon.dart';
import 'package:lhstore/features/shop/screens/addtocart/fill_add_tocart/fill_add_tocart.dart';
import 'package:lhstore/utils/constants/colors.dart';


class LHStoreAppBar extends StatelessWidget {
  const LHStoreAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LHAppBar(
      title: Row(
        children: [
          SizedBox(width: 2), // Adjust the spacing between CircleAvatar and text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Store",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: LHColor.white))
            ],
          ),
        ],
      ),
      actions: [
        LHCounterIcon(
          onPressed: () {
            Get.to(Filladd());
          },
          iconColor: LHColor.white,
        ),
      ],
    );
  }
}
