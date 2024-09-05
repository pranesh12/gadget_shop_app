import 'package:flutter/material.dart';
import 'package:gadget_shop/widgets/home_appBar.dart';
import 'package:gadget_shop/widgets/search_item.dart';

class Front extends StatefulWidget {
  const Front({super.key});

  @override
  _FrontState createState() => _FrontState();
}

class _FrontState extends State<Front> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        // const HomeAppBar(),

        // const SearchItem(),
        Container(
          height: 500,
          color: Color.fromARGB(255, 75, 105, 255),
          child: const Column(
            children: [
              HomeAppBar(),
              const SizedBox(
                height: 10,
              ),
              SearchItem()
            ],
          ),
        )
      ],
    ));
  }
}
