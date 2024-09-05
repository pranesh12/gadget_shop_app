import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:gadget_shop/screens/cart_screen.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  _HomeAppBarState createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Container(
              alignment: Alignment.centerLeft,
              child: const Column(
                children: [
                  Text(
                    "Good day for shopping",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Gadeget Shop",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),
          const Spacer(),
          badges.Badge(
            badgeContent: const Text(
              "1",
              style: TextStyle(color: Colors.white),
            ),
            badgeStyle: const badges.BadgeStyle(
                badgeColor: Color.fromARGB(255, 253, 62, 62)),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CartScreen()));
              },
              child: const Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
