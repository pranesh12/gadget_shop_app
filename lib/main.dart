import 'package:flutter/foundation.dart'; // For kReleaseMode
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart'; // Import DevicePreview
import 'package:flutter/services.dart';
import 'package:kick_start/screens/front.dart';
import 'package:kick_start/screens/onboarding.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Your existing onboarding screen

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
  String email = "";

  @override
  void initState() {
    super.initState();
    _loadDataFromPrefs();
  }

  Future<void> _loadDataFromPrefs() async {
    prefs = await SharedPreferences.getInstance();

    String? storedEmail = prefs.getString('email');

    setState(() {
      email = storedEmail ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding Screen',
      theme: ThemeData(
        useMaterial3: true,
      ),
      builder: DevicePreview.appBuilder,
      home: email.isNotEmpty ? const Front() : const Onboarding(),
    );
  }
}
