import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lhstore/utils/constants/colors.dart';

class listtile extends StatelessWidget {
  const listtile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Iconsax.heart,
            color: LHColor.primary1,
            ),
            title: Text('Wishlist'),
            trailing: Icon(Iconsax.arrow_right),
          ),
          ListTile(
            leading: Icon(Iconsax.truck,
            color: LHColor.primary1,
            ),
            title: Text('Shipping and Payment'),
            trailing: Icon(Iconsax.arrow_right),
          ),
          ListTile(
            leading: Icon(Iconsax.refresh,
            color: LHColor.primary1,
            ),
            title: Text('Refund Policy'),
            trailing: Icon(Iconsax.arrow_right),
          ),
          ListTile(
            leading: Icon(Iconsax.support,
            color: LHColor.primary1,
            ),
            title: Text('Support'),
            trailing: Icon(Iconsax.arrow_right),
          ),
        ],
      ),
    );
  }
}