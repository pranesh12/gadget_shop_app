import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class OrderList extends StatefulWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //box or card
        for (int i = 1; i < 5; i++)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            height: 110,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                //first Item
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(181, 246, 246, 246),
                  ),
                  child: Image.asset(
                    "assets/images/1.png",
                    height: 60,
                    width: 60,
                  ),
                ),

                const SizedBox(
                  width: 12,
                ),

                //middle item
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Text("K20 pro"),
                          const SizedBox(width: 10),
                          badges.Badge(
                            badgeStyle: badges.BadgeStyle(
                              shape: badges.BadgeShape.twitter,
                              badgeColor: Colors.blue,
                            ),
                            badgeContent: const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "Samsung",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

        //Checkout
      ],
    );
  }
}
