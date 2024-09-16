import 'package:flutter/foundation.dart'; // For kReleaseMode
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart'; // Import DevicePreview
import 'package:gadget_shop/screens/onboarding.dart'; // Your existing onboarding screen

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode, // Only enable in debug mode
      builder: (context) => const MyApp(), // Wrap your MyApp widget
    ),
  );
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
      // Add DevicePreview support
      builder: DevicePreview.appBuilder,
      useInheritedMediaQuery:
          true, // Necessary for device preview to work properly
      home: const Onboarding(),
    );
  }
}
