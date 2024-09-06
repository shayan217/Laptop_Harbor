import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/helpers/helpers_fuctions.dart';

class LHSearchScreen extends StatefulWidget {
  const LHSearchScreen({Key? key}) : super(key: key);

  @override
  _LHSearchScreenState createState() => _LHSearchScreenState();
}

class _LHSearchScreenState extends State<LHSearchScreen> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dark = LHHelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: dark ? LHColor.light : LHColor.dark),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: TextField(
          focusNode: _focusNode,
          decoration: InputDecoration(
            hintText: 'Search by brand, category, etc',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(10.0),
            enabledBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: dark ? LHColor.light : LHColor.dark),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color:
                      Colors.transparent), // Set transparent color when focused
            ),
          ),
        ),
      ),
      body: Padding(
          padding:
              const EdgeInsets.all(16.0), // Add padding around the ListTile
          child: Column(
            children: [
              ListTile(
                leading: Icon(Iconsax.bag_timer, color: LHColor.primary1),
                title: Text('google HeadPhones'),
                trailing: Icon(Iconsax.close_square),
                onTap: () {
                  // Get.to(Cardscreen());
                },
              ),
              ListTile(
                leading: Icon(Iconsax.bag_timer, color: LHColor.primary1),
                title: Text('Mac Book'),
                trailing: Icon(Iconsax.close_square),
                onTap: () {},
              ),
                ListTile(
                leading: Icon(Iconsax.bag_timer, color: LHColor.primary1),
                title: Text('Air pods'),
                trailing: Icon(Iconsax.close_square),
                onTap: () {},
              ),
            ],
          )),
    );
  }
}
