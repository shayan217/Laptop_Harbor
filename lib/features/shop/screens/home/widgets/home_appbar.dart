import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lhstore/common/widgets/appbar/appbar.dart';
import 'package:lhstore/common/widgets/product_cart/cart_menu_icon.dart';
import 'package:lhstore/features/personlization/controllers/user_controller.dart';
import 'package:lhstore/features/shop/screens/addtocart/fill_add_tocart/fill_add_tocart.dart';
import 'package:lhstore/features/shop/screens/profile/profile_update/profile.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/constants/image_strings.dart';
import 'package:lhstore/utils/constants/text_strings.dart';
import 'package:lhstore/utils/helpers/Circularavatar.dart';
import 'package:lhstore/utils/helpers/shimmer.dart';

class LHHomeAppBar extends StatelessWidget {

  const LHHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return LHAppBar(
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: GestureDetector(
              onTap: () {
                Get.to(ProfileUpdate());
              },
              child: Obx(() {
                final networkImage = controller.user.value.profilePicture;
                final image =
                    networkImage.isNotEmpty ? networkImage : LHImages.avatarImage;
              
                return controller.imageUploading.value
                    ? const LHShimmerEffect(
                        width: 60,
                        height: 60,
                        radius: 100,
                      )
                    : LHCircularImage(
                        image: image,
                        width: 60,
                        height: 60,
                        isNetworkImage: networkImage.isNotEmpty,
                      );
              }),
            ),
          ),
          SizedBox(
              width: 2), // Adjust the spacing between CircleAvatar and text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(LHText.homeAppbarTitle,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: LHColor.grey)),
              Obx(() {
                if (controller.profileLoading.value) {
                  return LHShimmerEffect(height: 15, width: 80);
                } else {
                  return Text(controller.user.value.fullName,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: LHColor.white));
                }
              })
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
