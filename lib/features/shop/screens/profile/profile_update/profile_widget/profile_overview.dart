import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lhstore/common/widgets/custom_shapes/containers/third_header.dart';
import 'package:lhstore/common/widgets/text/section_header.dart';
import 'package:lhstore/features/personlization/controllers/user_controller.dart';
import 'package:lhstore/features/shop/screens/profile/profile_update/profile_address.dart';
import 'package:lhstore/features/shop/screens/profile/profile_update/profile_edit.dart';
import 'package:lhstore/features/shop/screens/profile/profile_update/profile_gender.dart';
import 'package:lhstore/features/shop/screens/profile/profile_update/profile_phone.dart';
import 'package:lhstore/features/shop/screens/profile/profile_update/profile_username.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/constants/image_strings.dart';
import 'package:lhstore/utils/constants/sizes.dart';
import 'package:lhstore/utils/helpers/Circularavatar.dart';
import 'package:lhstore/utils/helpers/customSnakbar.dart';
import 'package:lhstore/utils/helpers/shimmer.dart';

class Profile_overview extends StatelessWidget {
  const Profile_overview({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Column(
      children: [
        // Add padding to move the image down
        // SizedBox(height: 50),
        LHThiredHeaderContainer(
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Obx(() {
                        final networkImage =
                            controller.user.value.profilePicture;
                        final image = networkImage.isNotEmpty
                            ? networkImage
                            : LHImages.avatarImage;

                        return controller.imageUploading.value
                            ? const LHShimmerEffect(
                                width: 150,
                                height: 150,
                                radius: 80,
                              )
                            : LHCircularImage(
                                image: image,
                                width: 150,
                                height: 150,
                                isNetworkImage: networkImage.isNotEmpty,
                              );
                      }),
                      Positioned(
                        bottom: 0,
                        right: 28,
                        child: GestureDetector(
                          onTap: () {
                            controller.uploadUserProfilePicture();
                          },
                          child: CircleAvatar(
                            radius: 17,
                            backgroundColor: Colors
                                .black, // Set the background color of the inner circle to black
                            child: Icon(
                              Icons.add,
                              color: Colors
                                  .white, // Set the color of the icon to purple
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Add other widgets as needed
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(LHSize.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LHSectionHeading(
                title: 'Profile Information',
                showActionButton: false,
                textColor: dark ? LHColor.accent : LHColor.secondary,
              ),
              SizedBox(
                height: LHSize.spaceBtwSections,
              ),
              Row(
                children: [
                  Text(
                    'Name :',
                    style: TextStyle(),
                  ),
                  SizedBox(width: 80),
                  Expanded(
                    child: Text(
                      controller.user.value.fullName,
                      style: TextStyle(
                        color: dark ? LHColor.accent : LHColor.secondary,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(ProfileEdit());
                    },
                    child: Icon(
                      Iconsax.arrow_right,
                      color: dark ? LHColor.accent : LHColor.secondary,
                      size: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: LHSize.spaceBtwItems,
              ),
              Row(
                children: [
                  Text(
                    'Username :',
                    style: TextStyle(),
                  ),
                  SizedBox(width: 57),
                  Expanded(
                    child: Text(
                      controller.user.value.userName,
                      style: TextStyle(
                        color: dark ? LHColor.accent : LHColor.secondary,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(ProfileEditUsername());
                    },
                    child: Icon(
                      Iconsax.arrow_right,
                      color: dark ? LHColor.accent : LHColor.secondary,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(
          height: 20,
        ),

        Padding(
          padding: EdgeInsets.all(LHSize.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LHSectionHeading(
                title: 'Personal Information',
                showActionButton: false,
                textColor: dark ? LHColor.accent : LHColor.secondary,
              ),
              SizedBox(
                height: LHSize.spaceBtwSections,
              ),
              Row(
                children: [
                  Text(
                    'User ID :',
                    style: TextStyle(),
                  ),
                  SizedBox(width: 72),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        FlutterClipboard.copy(controller.user.value.id)
                            .then((value) {
                          LHLoader.successSnackBar(
                              title: 'Success', message: 'User Id is copied');
                        });
                      },
                      child: Text(
                        controller.user.value.id,
                        style: TextStyle(
                          color: dark ? LHColor.accent : LHColor.secondary,
                          fontSize: 12,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      FlutterClipboard.copy(controller.user.value.id)
                          .then((value) {
                        LHLoader.successSnackBar(
                            title: 'Success', message: 'User Id is copied');
                      });
                    },
                    child: Icon(
                      Iconsax.copy,
                      color: dark ? LHColor.accent : LHColor.secondary,
                      size: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: LHSize.spaceBtwItems,
              ),
              Row(
                children: [
                  Text(
                    'Phone Number :',
                    style: TextStyle(),
                  ),
                  SizedBox(width: 30),
                  Expanded(
                    child: Text(
                      controller.user.value.phoneNumber,
                      style: TextStyle(
                        color: dark ? LHColor.accent : LHColor.secondary,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(ProfilePhoneEdit());
                    },
                    child: Icon(
                      Iconsax.arrow_right,
                      color: dark ? LHColor.accent : LHColor.secondary,
                      size: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: LHSize.spaceBtwItems,
              ),
              Row(
                children: [
                  Text(
                    'Gender :',
                    style: TextStyle(),
                  ),
                  SizedBox(width: 74),
                  Expanded(
                    child: Text(
                      'Male',
                      style: TextStyle(
                        color: dark ? LHColor.accent : LHColor.secondary,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(ProfileGenderEdit());
                    },
                    child: Icon(
                      Iconsax.arrow_right,
                      color: dark ? LHColor.accent : LHColor.secondary,
                      size: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: LHSize.spaceBtwItems,
              ),
              Row(
                children: [
                  Text(
                    'Date of Birth :',
                    style: TextStyle(),
                  ),
                  SizedBox(width: 43),
                  Expanded(
                    child: Text(
                      '21 May 2003',
                      style: TextStyle(
                        color: dark ? LHColor.accent : LHColor.secondary,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: LHSize.spaceBtwItems,
              ),
              Row(
                children: [
                  Text(
                    'E-mail :',
                    style: TextStyle(),
                  ),
                  SizedBox(width: 78),
                  Expanded(
                    child: Text(
                      controller.user.value.email,
                      style: TextStyle(
                        color: dark ? LHColor.accent : LHColor.secondary,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: LHSize.spaceBtwItems,
              ),
              Row(
                children: [
                  Text(
                    'Address :',
                    style: TextStyle(),
                  ),
                  SizedBox(width: 74),
                  Expanded(
                    child: Text(
                      controller.user.value.address,
                      style: TextStyle(
                        color: dark ? LHColor.accent : LHColor.secondary,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(ProfileAddressEdit());
                    },
                    child: Icon(
                      Iconsax.arrow_right,
                      color: dark ? LHColor.accent : LHColor.secondary,
                      size: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: LHSize.spaceBtwItems * 2,
              ),
              Center(
                child: Container(
                  width: 200.0, // Set the desired width
                  child: ElevatedButton(
                    onPressed: () => controller.deleteAccountWarningPopup(),
                    child: Text("Account Delete"),
                    style: ElevatedButton.styleFrom(
                      primary: LHColor
                          .primary, // Use 'primary' instead of 'backgroundColor'
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      side: BorderSide(color: LHColor.primary),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
