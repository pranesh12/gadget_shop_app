import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:gadget_shop/models/product.dart';
import 'package:gadget_shop/screens/product_details.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
            mainAxisSpacing: 10,
            crossAxisSpacing: 10, // Dynamic crossAxisCount
          ),
          itemBuilder: (context, index) {
            Product product = widget.products[index];
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
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
                      // Image
                      Positioned(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetails(
                                          product: product,
                                        )));
                          },
                          child: Image.network(
                            product
                                .thumbnail, // Assuming Product has imagePath property
                            height: 110,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Brand details
                  Container(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 12),
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      product.title, // Assuming Product has title property
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                  // Brand name
                  Container(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 12),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(product
                                  .brand), // Assuming Product has brand property
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
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ],
                      ),
                    ]),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
