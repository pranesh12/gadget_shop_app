import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          // Adjust the radius
          child: Container(
            padding: const EdgeInsets.all(25),
            height: 250,
            decoration: BoxDecoration(
              color: Colors.white, // Background color for better visualization
            ),
            child: PageView(
              controller: _controller,
              children: [
                Image.network('https://via.placeholder.com/250',
                    fit: BoxFit.cover),
                Image.network('https://via.placeholder.com/250',
                    fit: BoxFit.cover),
                Image.network('https://via.placeholder.com/250',
                    fit: BoxFit.cover),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        SmoothPageIndicator(
          controller: _controller, // PageController
          count: 3, // Number of pages
          effect: const ExpandingDotsEffect(
            activeDotColor: Colors.blue,
            dotColor: Colors.grey,
            dotHeight: 8,
            dotWidth: 8,
            expansionFactor: 3,
            spacing: 4,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
