// firebase_service.dart

import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<DocumentSnapshot>> fetchCategories() async {
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('Categories').get();

  return querySnapshot.docs;
}


Future<List<DocumentSnapshot>> fetchBrands() async {
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('Brands').get();

  return querySnapshot.docs;
}

Future<List<DocumentSnapshot>> fetchProduct() async {
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('Products').get();

  return querySnapshot.docs;
}

Future<Map<String, dynamic>> fetchProducts(String productId) async {
  var doc = await FirebaseFirestore.instance.collection('Products').doc(productId).get();
  var data = doc.data() as Map<String, dynamic>? ?? {};
  return data;
}

