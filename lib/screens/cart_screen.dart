import 'package:flutter/material.dart';

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
              for (int i = 1; i < 5; i++)
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                            color: Color.fromARGB(181, 212, 209, 209)),
                        child: Image.asset(
                          "assets/images/$i.png",
                          height: 60,
                          width: 60,
                        ),
                      ),

                      //middle item
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Brand Name"),
                            const Text("Product Name Like Samsung"),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.green,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.add),
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Text(
                                    "34",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(width: 20),
                                  CircleAvatar(
                                    backgroundColor: Colors.red,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.remove),
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            //last iem
                          ],
                        ),
                      ),
                      Container(
                        child: Text(
                          "\$646",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      )
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
