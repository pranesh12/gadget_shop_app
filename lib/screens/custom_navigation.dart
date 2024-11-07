import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:kick_start/screens/cart_screen.dart';
import 'package:kick_start/screens/front.dart';
import 'package:kick_start/screens/profile.dart';

class CustomNavigation extends StatefulWidget {
  const CustomNavigation({super.key});

  @override
  CustomNavigationState createState() => CustomNavigationState();
}

class CustomNavigationState extends State<CustomNavigation> {
  int selectedIdx = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

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

  void _goToCartPage() {
    final CurvedNavigationBarState? navBarState =
        _bottomNavigationKey.currentState;
    navBarState?.setPage(1); // Go to Cart page
    setState(() {
      selectedIdx = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gadget Shop",
      home: Scaffold(
        body: IndexedStack(
          index: selectedIdx,
          children: screens,
        ),
        bottomNavigationBar: MynavigationBar(
          onTap: _onTap,
          selectedIdx: selectedIdx,
          bottomNavigationKey: _bottomNavigationKey,
        ),
      ),
    );
  }
}

class MynavigationBar extends StatelessWidget {
  const MynavigationBar({
    required this.onTap,
    required this.selectedIdx,
    required this.bottomNavigationKey,
    super.key,
  });

  final void Function(int) onTap;
  final int selectedIdx;
  final GlobalKey<CurvedNavigationBarState> bottomNavigationKey;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      key: bottomNavigationKey,
      height: 55,
      items: const [
        Icon(Icons.home),
        Icon(Icons.shopping_cart),
        Icon(Icons.person),
      ],
      index: selectedIdx,
      onTap: onTap,
    );
  }
}
