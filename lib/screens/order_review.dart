import 'package:flutter/material.dart';
import 'package:gadget_shop/widgets/Order/order_list.dart';
import 'package:gadget_shop/widgets/order/order_ammount.dart';

class OrderReview extends StatefulWidget {
  const OrderReview({Key? key}) : super(key: key);

  @override
  _OrderReviewState createState() => _OrderReviewState();
}

class _OrderReviewState extends State<OrderReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Order Review"),
      ),
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
          child: Column(
            children: [OrderList(), OrderAmmount()],
          )),
    );
  }
}
