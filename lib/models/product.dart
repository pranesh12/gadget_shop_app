class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final int discountPercentage;
  final String category;
  final String brand;
  final String material;
  final String countryOfOrigin;
  final int size;
  final String thumbnail;
  final List<String> images;
  final int remainingStock;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.category,
    required this.brand,
    required this.material,
    required this.countryOfOrigin,
    required this.size,
    required this.thumbnail,
    required this.images,
    required this.remainingStock,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      discountPercentage: json['discountPercentage'],
      category: json['category'],
      brand: json['brand'],
      material: json['material'] ?? '',
      countryOfOrigin: json['countryOfOrigin'],
      size: json['size'],
      thumbnail: json['thumbnail'],
      images: List<String>.from(json['images'].map((img) => img['image'])),
      remainingStock: json['remainingStock'],
    );
  }
}
