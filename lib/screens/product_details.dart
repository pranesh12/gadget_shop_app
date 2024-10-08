import 'package:flutter/material.dart';
import 'package:gadget_shop/models/cart.dart';
import 'package:gadget_shop/models/product.dart';
import 'package:gadget_shop/providers/cart_provider.dart';
import 'package:gadget_shop/screens/cart_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductDetails extends ConsumerStatefulWidget {
  final Product product;
  const ProductDetails({super.key, required this.product});

  @override
  ProductDetailsState createState() => ProductDetailsState();
}

class ProductDetailsState extends ConsumerState<ProductDetails> {
  // List of image URLs (you can replace with your actual image paths)

  // Track the selected image index
  int _selectedImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    var product = widget.product;
    hadleAddToCart() {
      // Add product to the cart using CartNotifier
      final cartIem = Cart(
          productId: product.id,
          title: product.title,
          thumbnail: product.thumbnail,
          brand: product.brand,
          price: product.price);
      ref.read(cartProvider.notifier).addToCart(cartIem);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("${product.title} added to cart!"),
            InkWell(
              child: const Text(
                "View",
                style: TextStyle(color: Color.fromARGB(255, 72, 59, 255)),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CartScreen()));
              },
            )
          ]),
        ),
      );
    }

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
                  product.images[_selectedImageIndex],
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progess) {
                    if (progess == null) {
                      return child;
                    } else {
                      return const Center(
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
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(product.images.length, (index) {
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
                          product.images[index],
                          width: 60,
                          height: 60,
                        ),
                      ),
                    );
                  }),
                ),
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
                    product.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Stock Status and Brand
                  const Row(
                    children: [
                      Text('Stock: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('In Stock'),
                      SizedBox(width: 8),
                      Text('Nike', style: TextStyle(color: Colors.blue)),
                    ],
                  ),

                  const SizedBox(height: 16),
                  Text(product.description),
                  const SizedBox(height: 16),
                  // Color Selection

                  const SizedBox(height: 16),
                  // Size Selection
                  const Text('Size'),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _buildSizeButton(context, 'EU 30'),
                      _buildSizeButton(context, 'EU 32'),
                      _buildSizeButton(context, 'EU 34'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Checkout Button

                  const SizedBox(height: 16),
                  // Description
                  ExpansionTile(
                    title: const Text('Description'),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          product.description,
                        ),
                      ),
                    ],
                  ),
                  // Reviews
                  const ExpansionTile(
                    title: Text('Reviews (199)'),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
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
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartScreen()),
                );
              },
              child: const Text(
                'View Cart',
                style: TextStyle(color: Color.fromARGB(248, 5, 29, 245)),
              ),
            ),
            ElevatedButton(
              onPressed: hadleAddToCart,
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for color circles

  // Helper widget for size buttons
  Widget _buildSizeButton(BuildContext context, String size) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: OutlinedButton(
        onPressed: () {},
        child: Text(size),
      ),
    );
  }
}
