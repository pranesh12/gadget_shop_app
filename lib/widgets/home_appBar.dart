import 'package:flutter/material.dart';
import 'package:gadget_shop/screens/cart_screen.dart';
import 'package:gadget_shop/screens/login.dart';
import 'package:gadget_shop/screens/profile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeAppBar extends ConsumerStatefulWidget {
  const HomeAppBar({super.key});

  @override
  HomeAppBarState createState() => HomeAppBarState();
}

class HomeAppBarState extends ConsumerState<HomeAppBar> {
  late SharedPreferences prefs;
  String firstName = "";
  String lastName = "";

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
                  firstName.isEmpty
                      ? const Text(
                          "Hello  Welcome to",
                          style: TextStyle(color: Colors.white),
                        )
                      : Text(
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
          InkWell(
            onTap: () {
              firstName.isNotEmpty
                  ? Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Profile()))
                  : Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login()));
            },
            child: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
