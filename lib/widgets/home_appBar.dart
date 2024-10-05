import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:gadget_shop/screens/cart_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  HomeAppBarState createState() => HomeAppBarState();
}

class HomeAppBarState extends State<HomeAppBar> {
  late SharedPreferences prefs;
  String firstName = "";
  String lastName = "";
  int cartItemCount = 0;

  @override
  void initState() {
    super.initState();
    _loadDataFromPrefs();
  }

  Future<void> _loadDataFromPrefs() async {
    prefs = await SharedPreferences.getInstance();

    // Retrieve data from SharedPreferences
    String? storedFirstName = prefs.getString('firstName');
    String? storedLastName = prefs.getString('lastName');

    // If the data exists, update the state
    setState(() {
      firstName = storedFirstName ?? "";
      lastName = storedLastName ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Container(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello $firstName $lastName, Welcome to",
                    style: const TextStyle(color: Colors.white),
                  ),
                  const Text(
                    "Kick Street",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),
          const Spacer(),
          badges.Badge(
            badgeContent: Text(
              cartItemCount.toString(),
              style: const TextStyle(color: Colors.white),
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
