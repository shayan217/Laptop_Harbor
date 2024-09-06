import 'package:get/get.dart';

// Model class to represent a product
class ProductModel {
  final String image;
  final String title;
  final String description;
  final double price;
  final String brand;
  int quantity; 

  // Method to set the userId/ Added quantity property to ProductModel

  ProductModel({
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.brand,
    this.quantity = 1, // Default quantity is 1
  });
}

// Controller class for managing the cart state
class CartController extends GetxController {
    String? userId;
  void setUserId(String id) {
    userId = id;
  }
  // Observable list to store cart items
  RxList<ProductModel> cartItems = <ProductModel>[].obs;

  // Method to add a product to the cart
  void addToCart(ProductModel product) {
    cartItems.add(product);
    print('Cart items count: ${cartItems.length}');
  }

  // Method to remove a product from the cart
  void removeFromCart(ProductModel product) {
    cartItems.remove(product);
  }

  // Method to clear all items from the cart
  void clearCart() {
    cartItems.clear();
  }

  // Method to get the total price of items in the cart
  double getTotalPrice() {
    return cartItems.fold(0.0, (sum, product) => sum + (product.price * product.quantity));
  }

  // Method to check if a product is already in the cart
  bool isProductInCart(ProductModel product) {
    return cartItems.contains(product);
  }

  // Method to increment the quantity of a product
  void incrementQuantity(ProductModel product) {
    product.quantity++;
    update(); // Notify listeners of the change
  }

  // Method to decrement the quantity of a product
  void decrementQuantity(ProductModel product) {
    if (product.quantity > 1) {
      product.quantity--;
      update(); // Notify listeners of the change
    }
  }
}
