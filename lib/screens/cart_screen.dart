import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              //box or car
              for (int i = 1; i < 8; i++)
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  height: 110,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //first Item
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(181, 246, 246, 246)),
                        child: Image.asset(
                          "assets/images/1.png",
                          height: 60,
                          width: 60,
                        ),
                      ),

                      //middle item
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Text("K20 pro"),
                              SizedBox(width: 10),
                              badges.Badge(
                                badgeStyle: badges.BadgeStyle(
                                  shape: badges.BadgeShape.twitter,
                                  badgeColor: Colors
                                      .blue, // Blue background for the tick
                                ),
                                badgeContent: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 12,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            "Samsung",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w700),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                radius: 15,
                                backgroundColor:
                                    const Color.fromARGB(255, 209, 209, 209),
                                child: IconButton(
                                  iconSize: 15,
                                  onPressed: () {},
                                  icon: const Icon(Icons.remove),
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 15),
                              Text(
                                "34",
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(width: 15),
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.blue,
                                child: IconButton(
                                  iconSize: 15,
                                  onPressed: () {},
                                  icon: const Icon(Icons.add),
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          //last iem
                        ],
                      ),
                      Text(
                        "\$646",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
                ),

              //Checkout

              Container(
                width: 500,
                margin:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                padding: const EdgeInsets.symmetric(vertical: 8),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Checkout \$2674",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
