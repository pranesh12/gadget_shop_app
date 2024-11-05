import 'package:flutter/material.dart';
import 'package:kick_start/screens/home.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  OnboardingState createState() => OnboardingState();
}

class OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // PageView for the onboarding screens
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                _buildPage(
                  image: 'assets/splash/1.png',
                  title: 'Choose Our Product',
                  description: 'Welcome to a world of limitless choices',
                ),
                _buildPage(
                  image: 'assets/splash/2.png',
                  title: 'On Time Delivery',
                  description:
                      'Reliable delivery service ensuring timely arrivals.',
                ),
                _buildPage(
                  image: 'assets/splash/3.png',
                  title: 'Let’s Go!',
                  description:
                      'Browse our collection and enjoy a seamless shopping experience',
                ),
              ],
            ),
          ),

          // Skip button
          Positioned(
            top: 40,
            right: 20,
            child: _currentPage < 2
                ? TextButton(
                    onPressed: () {
                      // Navigate to Main Page directly
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    },
                    child: const Text("Skip"),
                  )
                : const SizedBox.shrink(),
          ),

          // Next and Done buttons
          Positioned(
            bottom: 20,
            right: 20,
            child: _currentPage < 2
                ? TextButton(
                    onPressed: () {
                      // Go to next page
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: const Text("Next"),
                  )
                : ElevatedButton(
                    onPressed: () {
                      // Navigate to Main Page after final page
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    },
                    child: const Text("Done"),
                  ),
          ),
        ],
      ),
    );
  }
}

Widget _buildPage(
    {required String image,
    required String title,
    required String description}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(image, height: 300),
      const SizedBox(height: 20),
      Text(title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    ],
  );
}
