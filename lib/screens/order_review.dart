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
      body: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
            child: Column(
              children: [
                OrderList(),
                OrderAmmount(),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    width: 400,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: Text(
                      "Checkout",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )))
              ],
            )),
      ),
    );
  }
}
