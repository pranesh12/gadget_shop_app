import 'package:flutter/material.dart';
import 'package:kick_start/models/cart.dart';
import 'package:kick_start/models/product.dart';
import 'package:kick_start/providers/cart_provider.dart';
import 'package:kick_start/screens/cart_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductDetails extends ConsumerStatefulWidget {
  final Product product;
  const ProductDetails({super.key, required this.product});

  @override
  ProductDetailsState createState() => ProductDetailsState();
}

class ProductDetailsState extends ConsumerState<ProductDetails> {
  int _selectedImageIndex = 0;
  String? _selectedSize; // Track the selected size

  @override
  Widget build(BuildContext context) {
    var product = widget.product;
    hadleAddToCart() {
      if (_selectedSize == null) {
        // Show a warning if no size is selected
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Please select a size!"),
          ),
        );
        return;
      }

      // Add product to the cart using CartNotifier
      final cartIem = Cart(
        productId: product.id,
        title: product.title,
        thumbnail: product.thumbnail,
        brand: product.brand,
        price: product.price,
        // Include the selected size
      );
      ref.read(cartProvider.notifier).addToCart(cartIem);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "${product.title} added to cart!",
              overflow: TextOverflow.ellipsis,
            ),
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
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
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
                  const Text('Size'),
                  const SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildSizeButton(context, '39'),
                        _buildSizeButton(context, '40'),
                        _buildSizeButton(context, '41'),
                        _buildSizeButton(context, '42'),
                        _buildSizeButton(context, '43'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
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

  Widget _buildSizeButton(BuildContext context, String size) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            _selectedSize = size; // Update selected size
          });
        },
        child: Text(
          size,
          style: TextStyle(
            color: _selectedSize == size ? Colors.blue : Colors.black,
          ),
        ),
      ),
    );
  }
}
