import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  final String id;
  const Order({super.key, required this.id});

  @override
  OrderState createState() => OrderState();
}

class OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    print(widget.id);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [Text("Your orders")],
      ),
    );
  }
}
