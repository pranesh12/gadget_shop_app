import 'package:flutter/material.dart';

class ItemsWidget extends StatefulWidget {
  const ItemsWidget({super.key});

  @override
  _ItemsWidgetState createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.60,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      shrinkWrap: true,
      padding: const EdgeInsets.all(20),
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      children: [
        for (int i = 1; i <= 4; i++)
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Stack(
                    children: [
                      Positioned(
                          child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 180,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 246, 246, 246),
                            borderRadius: BorderRadius.circular(20)),
                      )),
                      //iamge
                      Positioned(child: Image.asset("assets/images/$i.png")),
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
                                color: const Color.fromARGB(240, 247, 225, 114),
                              ),
                              child: const Text(
                                "-50%",
                              ),
                            ),
                            const Icon(
                              Icons.favorite_border,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
