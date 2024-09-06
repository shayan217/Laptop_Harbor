class Product {
  final String imageUrl;
  final String description;
  final int price;
  final String ratingText;
  bool isFavorite;

  Product({
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.ratingText,
    this.isFavorite = false,
  });
}
