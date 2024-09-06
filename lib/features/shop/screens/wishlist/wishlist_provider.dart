import 'package:flutter/material.dart';

class WishlistProvider with ChangeNotifier {
  List<String> _wishlist = [];

  List<String> get wishlist => _wishlist;

  void addToWishlist(String productId) {
    if (!_wishlist.contains(productId)) {
      _wishlist.add(productId);
      notifyListeners();
    }
  }

  void removeFromWishlist(String productId) {
    _wishlist.remove(productId);
    notifyListeners();
  }

  bool isInWishlist(String productId) {
    return _wishlist.contains(productId);
  }
}
