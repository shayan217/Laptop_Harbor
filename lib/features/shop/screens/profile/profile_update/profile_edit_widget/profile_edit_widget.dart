import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lhstore/common/widgets/custom_shapes/containers/third_edit.dart';
import 'package:lhstore/common/widgets/text/section_header.dart';
import 'package:lhstore/features/personlization/controllers/user_controller.dart';
import 'package:lhstore/features/shop/controllers/update_name_controller.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/constants/image_strings.dart';
import 'package:lhstore/utils/constants/sizes.dart';
import 'package:lhstore/utils/constants/text_strings.dart';
import 'package:lhstore/utils/helpers/Circularavatar.dart';
import 'package:lhstore/utils/helpers/shimmer.dart';
import 'package:lhstore/utils/validations/validator.dart';

class profile_edit_widget extends StatelessWidget {
  const profile_edit_widget({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controllers = UserController.instance;

    final controller = Get.put(UpdateNameController());
    return Column(
      children: [
        LHThiredEditHeaderContainer(
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
                            controllers.user.value.profilePicture;
                        final image = networkImage.isNotEmpty
                            ? networkImage
                            : LHImages.avatarImage;

                        return controllers.imageUploading.value
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
                title: 'Update Name',
                showActionButton: false,
                textColor: dark ? LHColor.accent : LHColor.secondary,
              ),
              SizedBox(
                height: LHSize.spaceBtwSections,
              ),
              Form(
                key: controller.updateUserNameFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.firstName,
                      validator: (value) =>
                          LHValidator.validateEmptyText('First name', value),
                      expands: false,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.user),
                        labelText: LHText.firstName,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Set the desired border radius
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: LHColor.primary),
                          borderRadius: BorderRadius.circular(
                              10.0), // Match the same radius as above
                        ),
                      ),
                    ),

                    SizedBox(
                      height: LHSize.spaceBtwInputFields,
                    ),
                    //password
                    TextFormField(
                      controller: controller.LastName,
                      validator: (value) =>
                          LHValidator.validateEmptyText('Last name', value),
                      expands: false,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.user),
                        labelText: LHText.lastName,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Set the desired border radius
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: LHColor.primary),
                          borderRadius: BorderRadius.circular(
                              10.0), // Match the same radius as above
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: LHSize.spaceBtwItems * 4,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    controller.updateUserName();
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(LHColor.primary),
                    side: MaterialStateProperty.all<BorderSide>(
                        BorderSide(color: LHColor.primary)),
                    minimumSize: MaterialStateProperty.all<Size>(
                      Size(200, 50), // Adjust width and height as needed
                    ),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
