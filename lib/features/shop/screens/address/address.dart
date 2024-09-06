import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lhstore/features/personlization/controllers/user_controller.dart';
import 'package:lhstore/features/shop/controllers/update_name_controller.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/constants/sizes.dart';
import 'package:lhstore/utils/helpers/helpers_fuctions.dart';
import 'package:lhstore/utils/validations/validator.dart';
import 'package:lottie/lottie.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controllers = UserController.instance;

    final controller = Get.put(UpdateNameController());
    final dark = LHHelperFunction.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: dark ? LHColor.light : LHColor.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Address'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Lottie animated image
              Lottie.asset(
                'assets/json/address.json', // Replace with your Lottie animation file
                width: 200,
                height: 200,
              ),
              SizedBox(height: 20),
              Text(
                'Your Address',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              // Phone number input
              Form(
                key: controller.updateUserNameFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.address,
                      validator: (value) =>
                          LHValidator.validateEmptyText('Address', value),
                      expands: false,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.location),
                        labelText: "Address",
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
                    TextFormField(
                      controller: controller.phoneNumber,
                      validator: (value) =>
                          LHValidator.validateEmptyText('Phone No', value),
                      expands: false,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.call),
                        labelText: "Phone No",
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

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  controller.updateAddress();
                },
                style: ElevatedButton.styleFrom(
                  primary: LHColor.primary,
                  side: BorderSide(color: LHColor.primary), // Background color
                  minimumSize:
                      Size(double.infinity, 50), // Set width to maximum
                ),
                child: Text('Done'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
