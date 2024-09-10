import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

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
        const SizedBox(
            height: 16), // Spacing between the PageView and the indicator
        SmoothPageIndicator(
          controller: _controller, // PageController
          count: 3, // Number of pages
          effect: const ExpandingDotsEffect(
            activeDotColor: Colors.blue, // Color of the active dot
            dotColor: Colors.grey, // Color of inactive dots
            dotHeight: 8,
            dotWidth: 8,
            expansionFactor: 3, // How much the active dot expands
            spacing: 4, // Space between dots
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Don't forget to dispose the controller
    super.dispose();
  }
}
