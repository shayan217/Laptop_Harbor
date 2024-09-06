import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lhstore/data/repositories_authentication/authentication_repository.dart';
import 'package:lhstore/features/personlization/controllers/user_controller.dart';
import 'package:lhstore/features/shop/screens/myorders/myorders.dart';
import 'package:lhstore/features/shop/screens/profile/profile_update/profile.dart';
import 'package:lhstore/features/shop/screens/profile/widget/profilesmallContainer.dart';
import 'package:lhstore/features/shop/screens/wishlist/wishlist_provider.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/constants/image_strings.dart';
import 'package:lhstore/utils/helpers/Circularavatar.dart';
import 'package:lhstore/utils/helpers/helpers_fuctions.dart';
import 'package:lhstore/utils/helpers/shimmer.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class Profile_list_title extends StatelessWidget {
  const Profile_list_title({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    final dark = LHHelperFunction.isDarkMode(context);
    final wishlistProvider = Provider.of<WishlistProvider>(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            leading: Obx(() {
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
            title: Text(controller.user.value.fullName),
            subtitle: Text(controller.user.value.email),
            trailing: IconButton(
              onPressed: () {
                Get.to(ProfileUpdate());
              },
              icon: Icon(Iconsax.arrow_right),
            ),
          ),
          Divider(
            color: dark ? LHColor.darkGrey : LHColor.grey,
            height: 1,
          ),
          GestureDetector(
            onTap: () => Get.to(MyOrdersPage()),
            child: ListTile(
              leading: Icon(
                Iconsax.copy_success,
                color: LHColor.primary1,
              ),
              title: Text("My Orders"),
            ),
          ),
          ListTile(
            leading: Icon(
              Iconsax.heart,
              color: LHColor.primary1,
            ),
            title: Text("Wishlist"),
          ),
          SizedBox(
              height:
                  8), // Add some spacing between the Wishlist ListTile and the containers
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    for (String productId in wishlistProvider.wishlist)
      FutureBuilder(
        future: fetchProductDetails(productId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // You can show a shimmer effect while loading
            return Shimmer(
              gradient: LHColor.linearGradient1,
              child: buildSmallContainer('', isShimmer: true),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            print('Snapshot data: ${snapshot.data}');
            // Check if 'Image1' key exists in the map
            if (snapshot.data!.containsKey('Image1')) {
              String imagePath = snapshot.data!['Image1'];
              return buildSmallContainer(imagePath);
            } else {
              // Handle the case where 'image' key is not present
              return Text('Image not found');
            }
          }
        },
      ),
  ],
),

          ),
          ListTile(
            leading: Icon(
              Iconsax.bag_timer,
              color: LHColor.primary1,
            ),
            title: Text("Browsing History"),
          ),
          Divider(
            color: dark ? LHColor.darkGrey : LHColor.grey,
            height: 1,
          ),
          ListTile(
            leading: Icon(
              Iconsax.home,
              color: LHColor.primary1,
            ),
            title: Text("Saved Address"),
          ),
          ListTile(
            leading: Icon(
              Iconsax.card,
              color: LHColor.primary1,
            ),
            title: Text("Payment"),
          ),
          Divider(
            color: dark ? LHColor.darkGrey : LHColor.grey,
            height: 1,
          ),
          ListTile(
            leading: Icon(
              Iconsax.truck,
              color: LHColor.primary1,
            ),
            title: Text("Shipping & Payment"),
          ),
          ListTile(
            leading: Icon(
              Iconsax.refresh,
              color: LHColor.primary1,
            ),
            title: Text("Refund Policy"),
          ),

          GestureDetector(
            onTap: () => AuthenticationRepository.instance.logout(),
            child: ListTile(
              leading: Icon(
                Iconsax.logout,
                color: LHColor.primary1,
              ),
              title: Text("Logout"),
            ),
          ),
        ],
      ),
    );
  }

Future<Map<String, dynamic>> fetchProductDetails(String productId) async {
  DocumentSnapshot snapshot = await FirebaseFirestore.instance
      .collection('Products')
      .doc(productId)
      .get();

  // Return a Map containing the fetched details with the correct key
  return {
    'Image1': snapshot['Image1'],
  };
}

}


