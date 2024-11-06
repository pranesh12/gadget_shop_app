import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kick_start/models/product.dart';
import 'package:kick_start/screens/product_details.dart';

class ProductCard extends ConsumerStatefulWidget {
  final List<Product> products;
  const ProductCard({super.key, required this.products});

  @override
  ProductCardState createState() => ProductCardState();
}

class ProductCardState extends ConsumerState<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Screen width and height
        double screenWidth = MediaQuery.of(context).size.width;

        // Dynamically calculate the number of columns
        int crossAxisCount = screenWidth > 600 ? 3 : 2;

        return GridView.builder(
          itemCount: widget.products.length, // Total number of products
          shrinkWrap: true,
          padding: const EdgeInsets.all(10),
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 0.80,
            mainAxisSpacing: 20,
            crossAxisSpacing: 17,
          ),
          itemBuilder: (context, index) {
            Product product = widget.products[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetails(product: product),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Positioned(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 4),
                            height: 120,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 246, 246, 246),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        // Product Image
                        Positioned(
                          child: Image.network(
                            product.thumbnail,
                            height: 110,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ],
                    ),
                    // Product Title
                    Container(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 12),
                      child: Text(
                        product.title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    // Brand and Price Details
                    Container(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                product.brand,
                                style: const TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(width: 5),
                              const badges.Badge(
                                badgeStyle: badges.BadgeStyle(
                                  shape: badges.BadgeShape.twitter,
                                  badgeColor: Colors.blue,
                                ),
                                badgeContent: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 12,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '\$${product.price.toString()}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
