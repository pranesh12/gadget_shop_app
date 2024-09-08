import 'package:flutter/material.dart';
import 'package:gadget_shop/widgets/category_list.dart';
import 'package:gadget_shop/widgets/home_appBar.dart';
import 'package:gadget_shop/widgets/product/product_card.dart';
import 'package:gadget_shop/widgets/search_item.dart';

class Front extends StatefulWidget {
  const Front({super.key});

  @override
  _FrontState createState() => _FrontState();
}

class _FrontState extends State<Front> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Expanded(
          child: Container(
            color: const Color.fromARGB(255, 75, 105, 255),
            child: Column(
              children: [
                HomeAppBar(),
                SizedBox(
                  height: 10,
                ),
                SearchItem(),
                SizedBox(
                  height: 14,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 15, top: 10),
                  child: Text(
                    "Categories",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                CategoryList(),
                const SizedBox(
                  height: 14,
                ),
              ],
            ),
          ),
        ),
        ProductCard()
      ],
    ));
  }
}
