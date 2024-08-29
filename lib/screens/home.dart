import 'package:flutter/material.dart';
import 'package:gadget_shop/screens/front.dart';
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
    Center(
      child: Text("Hello3"),
    ),
  ];

  void _onTap(int idx) {
    setState(() {
      selectedIdx = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIdx],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: "Store"),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "WhishList"),
          // BottomNavigationBarItem(icon: Icon(Icons.school), label: "Profile"),
        ],
        currentIndex: selectedIdx,
        onTap: _onTap,
        selectedItemColor: Colors.green,
      ),
    );
  }
}
