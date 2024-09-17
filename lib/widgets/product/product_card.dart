import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Screen width and height
        double screenWidth = MediaQuery.of(context).size.width;
        double screenHeight = MediaQuery.of(context).size.height;

        // Dynamically calculate the number of columns
        int crossAxisCount = screenWidth > 600 ? 3 : 2;

        // Dynamically calculate the child aspect ratio (width / height)
        double childAspectRatio =
            (screenWidth / crossAxisCount) / (screenHeight * 0.45);

        return GridView.count(
          childAspectRatio: childAspectRatio,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          shrinkWrap: true,
          padding: const EdgeInsets.all(10),
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: crossAxisCount, // Dynamic crossAxisCount
          children: [
            for (int i = 1; i <= 4; i++)
              // Card starts here
              Container(
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
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            height: 120,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 246, 246, 246),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        // Image
                        Positioned(
                          child: Image.asset(
                            "assets/images/$i.png",
                            height: 110,
                            fit: BoxFit.contain,
                            width: double.infinity,
                          ),
                        ),
                        Positioned(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color.fromARGB(
                                        240, 247, 225, 114),
                                  ),
                                  child: const Text("-50%"),
                                ),
                                const Icon(
                                  Icons.favorite_border,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    // Brand details
                    Container(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 12),
                      child: const Text(
                        "Green Nike sport Shoe",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                    // Brand name
                    Container(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 12),
                      child: const Row(
                        children: [
                          Text("K20 pro"),
                          SizedBox(width: 10),
                          badges.Badge(
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
                    ),
                    // Add to cart
                    Container(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "\$987",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
