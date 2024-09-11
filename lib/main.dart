import 'package:flutter/material.dart';
import 'package:gadget_shop/screens/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding Screen',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Onboarding(),
    );
  }
}
