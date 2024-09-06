import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lhstore/features/shop/controllers/cart_controller.dart';

class MyOrdersPage extends StatefulWidget {
  @override
  _MyOrdersPageState createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  final CartController _cartController = Get.put(CartController());
  final CollectionReference _ordersCollection =
      FirebaseFirestore.instance.collection('myorders');

  @override
  void initState() {
    super.initState();
    // Initialize user ID after authentication (replace with your authentication logic)
    initializeUserId();
  }

  Future<void> initializeUserId() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      _cartController.userId = user.uid;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _ordersCollection
            .where('userId', isEqualTo: _cartController.userId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('No orders available.'),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var order = snapshot.data!.docs[index];
              var timestamp = order['timestamp'];
              var subtotal = order['subtotal'];
              var shippingFee = order['shippingFee'];
              var taxFee = order['taxFee'];
              var total = order['total'];
              var products = order['products'];

              List<Widget> productWidgets = [];
              for (var product in products) {
                productWidgets.add(
                  ListTile(
                    leading: Image(image: NetworkImage(product['image'])),
                    title: Text(product['title']),
                    subtitle: Text('Price: \$${product['price'].toString()}'),
                  ),
                );
              }

              return Card(
                margin: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      trailing: Text('Order Date: ${timestamp.toDate()}'),
                    ),
                    SizedBox(height: 8),
                    ...productWidgets,
                    SizedBox(height: 8),
                    Column(
                      children: [
                        ListTile(
                          trailing: Text('Subtotal: \$${subtotal.toString()}'),
                        ),
                        ListTile(
                          trailing:
                              Text('Shipping Fee: \$${shippingFee.toString()}'),
                        ),
                        ListTile(
                          trailing: Text('Tax Fee: \$${taxFee.toString()}'),
                        ),
                        ListTile(
                          trailing: Text('Order Total: \$${total.toString()}'),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
