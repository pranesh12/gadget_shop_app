import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:kick_start/screens/cart_screen.dart';
import 'package:kick_start/screens/front.dart';
import 'package:kick_start/screens/profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int selectedIdx = 0;

  final List<Widget> screens = [
    const Front(),
    const CartScreen(),
    const Profile(),
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
        body: IndexedStack(
          index: selectedIdx,
          children: screens, // Pass the entire list here
        ),
        bottomNavigationBar:
            MynavigationBar(onTap: _onTap, selectedIdx: selectedIdx),
      ),
    );
  }
}

class MynavigationBar extends StatelessWidget {
  const MynavigationBar({
    required this.onTap,
    required this.selectedIdx,
    super.key,
  });

  final void Function(int) onTap;
  final int selectedIdx;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      items: const [
        Icon(Icons.home),
        Icon(Icons.shopping_cart),
        Icon(Icons.person),
      ],
      index: selectedIdx,
      onTap: onTap, // Directly pass the onTap callback here
    );
  }
}
