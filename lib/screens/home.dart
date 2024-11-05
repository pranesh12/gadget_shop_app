import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:kick_start/screens/front.dart';
import 'package:kick_start/screens/login.dart';
import 'package:kick_start/screens/profile.dart';
import 'package:kick_start/screens/register.dart';

import 'package:flutter_hooks/flutter_hooks.dart' hide Store;

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int selectedIdx = 0;
  final List<Widget> screens = [
    const Front(),
    const Login(),
    const Register(),
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
        body: screens[selectedIdx],
        bottomNavigationBar: MynavigationBar(_onTap),
      ),
    );
  }
}

class MynavigationBar extends HookWidget {
  const MynavigationBar(this._onTap, {super.key});
  final void Function(int)? _onTap;

  @override
  Widget build(BuildContext context) {
    final selectedIdx = useState(0);
    return CurvedNavigationBar(
      items: const [
        Icon(Icons.home),
        Icon(Icons.login),
        Icon(Icons.login),
        Icon(Icons.person_add),
      ],
      index: selectedIdx.value,
      onTap: (int idx) {
        selectedIdx.value = idx;
        _onTap!(idx);
      },
    );
  }
}
