class Cart {
  final String productId;
  final String title;
  final double price;
  final String thumbnail;
  final String brand;
  int quantity; // Changed quantity to int

  Cart({
    required this.productId,
    required this.title,
    required this.thumbnail,
    required this.brand,
    required this.price,
    this.quantity = 1, // Default quantity is set to 1
  });
}
