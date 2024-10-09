import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  CategoryListState createState() => CategoryListState();
}

class CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 1; i < 5; i++)
            Container(
              margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 12),
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Positioned(
                          child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                            child: Image.asset(
                          "assets/images/$i.png",
                          width: 40,
                          height: 40,
                        )),
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Android",
                    style: TextStyle(color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}
