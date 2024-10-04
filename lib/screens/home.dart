import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:gadget_shop/screens/cart_screen.dart';
import 'package:gadget_shop/screens/front.dart';
import 'package:gadget_shop/screens/login.dart';
import 'package:gadget_shop/screens/profile.dart';
import 'package:gadget_shop/screens/register.dart';
import 'package:gadget_shop/screens/store.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIdx = 0;
  final List<Widget> screens = [
    const Front(),
    const Store(),
    const Login(),
    Register(),
    const CartScreen()
  ];

  void _onTap(int idx) {
    setState(() {
      selectedIdx = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gadget Shop",
      home: Scaffold(
        body: screens[selectedIdx],
        bottomNavigationBar: CurvedNavigationBar(
          items: const [
            Icon(Icons.home),
            Icon(Icons.business),
            Icon(Icons.school),
            Icon(Icons.abc_sharp),
            Icon(Icons.ac_unit),
          ],
          index: selectedIdx,
          onTap: _onTap,
          // Optionally, you can customize the CurvedNavigationBar with other properties
        ),
      ),
    );
  }
}
