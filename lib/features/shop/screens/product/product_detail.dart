import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lhstore/features/shop/controllers/cart_controller.dart';
import 'package:lhstore/utils/constants/colors.dart';
import 'package:lhstore/utils/helpers/customSnakbar.dart';
import 'package:lhstore/utils/helpers/helpers_fuctions.dart';

class ProductDetail extends StatefulWidget {
  // final String productId;
  final String Image1, Image2, Image3, Image4;
  final String brand;
  final String color;
  final String description;
  final int price;
  final String rating;
  final int sold;
  final int storage;
  final String title;
  const ProductDetail({
    Key? key,
    // required this.productId,
    required this.Image1,
    required this.Image2,
    required this.Image3,
    required this.Image4,
    required this.brand,
    required this.color,
    required this.description,
    required this.price,
    required this.rating,
    required this.sold,
    required this.storage,
    required this.title,
  }) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int _currentCarouselIndex = 0;
  late CartController _cartController;

  @override
  void initState() {
    super.initState();
    _cartController = Get.put(CartController()); // Initialize CartController
  } // Get reference to the cart controller

//   late Map<String, dynamic> productData;

// @override
// void initState() {
//   super.initState();
//   // Initialize productData with an empty map
//   productData = {};
//   // Fetch product data when the widget is initialized
//   fetchProducts(widget.productId).then((data) {
//     setState(() {
//       productData = data;
//     });
//   });
// }

//   Future<Map<String, dynamic>> fetchProducts(String productId) async {
//     var doc = await FirebaseFirestore.instance.collection('Products').doc(productId).get();
//     return doc.data() as Map<String, dynamic>;
//   }

  @override
  Widget build(BuildContext context) {
        final dark = LHHelperFunction.isDarkMode(context);

    // Check if product data is available
    // if (productData == null) {
    //   // You can show a loading indicator here
    //   return Center(child: CircularProgressIndicator());
    // }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
          color:  dark ? LHColor.light : LHColor.dark,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400.0,
              child: Column(
                children: [
                  CarouselSlider(
                    items: [
                      _buildImageContainer(widget.Image1, 0),
                      _buildImageContainer(widget.Image2, 1),
                      _buildImageContainer(widget.Image3, 2),
                      _buildImageContainer(widget.Image4, 3),
                      // Add more images as needed
                    ],
                    options: CarouselOptions(
                      height: 350.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentCarouselIndex = index;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      // Change this to the actual number of images
                      4,
                      (index) => _buildDot(index),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              margin: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text(
                          widget.brand,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Icon(
                          Iconsax.verify5,
                          color: Colors.blue,
                          size: 18.0,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      '\$${widget.price}',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Iconsax.star5,
                          color: Colors.yellow,
                        ),
                        SizedBox(width: 4.0),
                        Text(
                          '${widget.rating}',
                          style: TextStyle(color: Colors.yellow),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 370.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: LHColor.primary,
                        ),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Storage'),
                          Text(widget.storage.toString()),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 370.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: LHColor.primary,
                        ),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Color'),
                          Text(widget.color),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: LHColor.light,
                          ),
                          width: 50.0,
                          height: 50.0,
                          child: Icon(
                            Iconsax.heart,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Implement the add to cart functionality
                      _cartController.addToCart(ProductModel(
                        image: widget.Image1,
                        title: widget.title,
                        description: widget.description,
                        price: widget.price.toDouble(),
                        brand: widget.brand,
                        // Add other properties as needed
                      ));

                      // Show a Snackbar
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //     content: Text('Item added to the cart'),
                      //     duration: Duration(
                      //         seconds: 2), // You can adjust the duration
                      //   ),
                      // );
                      LHLoader.successSnackBar(title: '🎉 Congratulations',  message: 'Item added to the cart');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: LHColor.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      side: BorderSide(
                        color: LHColor.primary,
                      ),
                      minimumSize: Size(250.0, 60.0),
                    ),
                    child: Text('Add to Cart'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product Description',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    widget.description,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageContainer(String imagePath, int index) {
    return Container(
      decoration: BoxDecoration(
        border: _currentCarouselIndex == index
            ? Border.all(
                color: LHColor.primary,
                width: 3,
              )
            : null,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Image.network(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildDot(int index) {
    return Container(
      width: 20.0,
      height: 4.0,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        color: _currentCarouselIndex == index ? LHColor.primary : Colors.grey,
      ),
    );
  }
}
