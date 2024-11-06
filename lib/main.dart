import 'package:flutter/foundation.dart'; // For kReleaseMode
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart'; // Import DevicePreview
import 'package:flutter/services.dart';
import 'package:kick_start/screens/cart_screen.dart';
import 'package:kick_start/screens/front.dart';
import 'package:kick_start/screens/login.dart';
import 'package:kick_start/screens/onboarding.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kick_start/screens/profile.dart';
import 'package:kick_start/screens/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    DevicePreview(
      enabled: !kReleaseMode, // Only enable in debug mode
      builder: (context) =>
          const ProviderScope(child: MyApp()), // Wrap your MyApp widget
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late SharedPreferences prefs;
  bool isLoggedIn = false; // Changed to a boolean for better clarity

  @override
  void initState() {
    super.initState();
    _loadDataFromPrefs();
  }

  Future<void> _loadDataFromPrefs() async {
    prefs = await SharedPreferences.getInstance();
    String? storedEmail = prefs.getString('email');

    setState(() {
      isLoggedIn = storedEmail != null && storedEmail.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => isLoggedIn ? const Front() : const Onboarding(),
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
        '/profile': (context) => const Profile(),
        '/cart': (context) => const CartScreen(),
      },
      title: 'Onboarding Screen',
      theme: ThemeData(
        useMaterial3: true,
      ),
      builder: DevicePreview.appBuilder,
    );
  }
}
