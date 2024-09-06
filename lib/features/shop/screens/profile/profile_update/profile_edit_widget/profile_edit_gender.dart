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
import 'package:lhstore/utils/helpers/Circularavatar.dart';
import 'package:lhstore/utils/helpers/shimmer.dart';

class profile_edit_gender extends StatelessWidget {
  const profile_edit_gender({
    Key? key,
    required this.dark,
  }) : super(key: key);

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
                title: 'Update Gender',
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
                    // Remove the TextFormField for phone number
                    DropdownButtonFormField<String>(
                      // value: controller.selectedGender,
                      items: ['Male', 'Female', 'Custom']
                          .map((String gender) {
                        return DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        // controller.selectedGender = value ?? '';
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.user),
                        labelText: 'Select Gender',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: LHColor.primary),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: LHSize.spaceBtwInputFields,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: LHSize.spaceBtwItems * 1,
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
                      Size(200, 50),
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
