import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  // List of image URLs (you can replace with your actual image paths)
  final List<String> _imageUrls = [
    'https://cdn.dummyjson.com/products/images/beauty/Eyeshadow%20Palette%20with%20Mirror/1.png',
    'https://cdn.dummyjson.com/products/images/beauty/Powder%20Canister/1.png',
    'https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/1.png',
  ];

  // Track the selected image index
  int _selectedImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Image Display
            Center(
              child: SizedBox(
                height: 250,
                child: Image.network(
                  _imageUrls[_selectedImageIndex],
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progess) {
                    if (progess == null) {
                      return child;
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ),
            // Image Thumbnails for Selection
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_imageUrls.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedImageIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: _selectedImageIndex == index
                              ? Colors.blue
                              : Colors.transparent,
                        ),
                      ),
                      child: Image.network(
                        _imageUrls[index],
                        width: 60,
                        height: 60,
                      ),
                    ),
                  );
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Rating and Price
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow),
                          Text('5.0 (199)'),
                        ],
                      ),
                      Text(
                        '\$35.0',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Product Title
                  Text(
                    'Nike Air Jordon Shoes',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  // Stock Status and Brand
                  Row(
                    children: [
                      Text('Stock: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('In Stock'),
                      SizedBox(width: 8),
                      Text('Nike', style: TextStyle(color: Colors.blue)),
                    ],
                  ),
                  SizedBox(height: 16),
                  // Color Selection
                  Text('Color'),
                  Row(
                    children: [
                      _buildColorCircle(Colors.orange),
                      _buildColorCircle(Colors.black),
                      _buildColorCircle(Colors.brown),
                    ],
                  ),
                  SizedBox(height: 16),
                  // Size Selection
                  Text('Size'),
                  Row(
                    children: [
                      _buildSizeButton(context, 'EU 30'),
                      _buildSizeButton(context, 'EU 32'),
                      _buildSizeButton(context, 'EU 34'),
                    ],
                  ),
                  SizedBox(height: 16),
                  // Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Checkout'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Description
                  ExpansionTile(
                    title: Text('Description'),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Nike Air Jordon Shoes for running. Quality product, Long Lasting',
                        ),
                      ),
                    ],
                  ),
                  // Reviews
                  ExpansionTile(
                    title: Text('Reviews (199)'),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('User reviews will be displayed here.'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {},
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Add to Bag'),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for color circles
  Widget _buildColorCircle(Color color) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: 36,
      width: 36,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

  // Helper widget for size buttons
  Widget _buildSizeButton(BuildContext context, String size) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: OutlinedButton(
        onPressed: () {},
        child: Text(size),
      ),
    );
  }
}
