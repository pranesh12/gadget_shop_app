import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:kick_start/providers/cart_provider.dart';
import 'package:kick_start/screens/checkout.dart';
import 'package:kick_start/screens/front.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kick_start/models/cart.dart';
import 'package:shared_preferences/shared_preferences.dart';
// Make sure you import your Cart model

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  CartScreenState createState() => CartScreenState();
}

class CartScreenState extends ConsumerState<CartScreen> {
  late SharedPreferences prefs;
  String firstName = "";
  String lastName = "";
  String email = "";

  @override
  void initState() {
    super.initState();
    _loadDataFromPrefs();
  }

  Future<void> _loadDataFromPrefs() async {
    prefs = await SharedPreferences.getInstance();
    String? storedFirstName = prefs.getString('firstName');
    String? storedLastName = prefs.getString('lastName');
    String? storedEmail = prefs.getString('email');

    setState(() {
      firstName = storedFirstName ?? "";
      lastName = storedLastName ?? "";
      email = storedEmail ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    // Watch the cart provider to get the current state of the cart
    final cartItems = ref.watch(cartProvider);
    final cartNotifier = ref.read(cartProvider.notifier);

    double totalCost =
        cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));

    addProduct(Cart cartItem) {
      cartNotifier.updateQuantity(cartItem.productId, cartItem.quantity + 1);
    }

    removeProduct(Cart cartItem) {
      if (cartItem.quantity > 1) {
        cartNotifier.updateQuantity(cartItem.productId, cartItem.quantity - 1);
      } else {
        cartNotifier.removeFromCart(
            cartItem.productId); // Remove the item if quantity is 1
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
        ),
        body: cartItems.isNotEmpty
            ? SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      // Cart Items ListView.builder
                      ListView.builder(
                        itemCount: cartItems.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          Cart cartItem =
                              cartItems[index]; // Get the current cart item

                          return Dismissible(
                            key: ValueKey(cartItem.productId),
                            onDismissed: (context) {
                              cartNotifier.removeFromCart(cartItem.productId);
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 4),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              height: 110,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Image and Brand
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Image.network(
                                      cartItem.thumbnail,
                                      height: 60,
                                      width: 60,
                                      fit: BoxFit.cover,
                                    ),
                                  ),

                                  // Product Details
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(cartItem.title), // Product title
                                          const SizedBox(width: 10),
                                          const badges.Badge(
                                            badgeStyle: badges.BadgeStyle(
                                              shape: badges.BadgeShape.twitter,
                                              badgeColor: Colors.blue,
                                            ),
                                            badgeContent: Icon(
                                              Icons.check,
                                              color: Colors.white,
                                              size: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        cartItem.brand,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // Decrease quantity button
                                          CircleAvatar(
                                            radius: 15,
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 209, 209, 209),
                                            child: IconButton(
                                              iconSize: 15,
                                              onPressed: () =>
                                                  {removeProduct(cartItem)},
                                              icon: const Icon(Icons.remove),
                                              color: Colors.white,
                                            ),
                                          ),
                                          const SizedBox(width: 15),
                                          Text(
                                            cartItem.quantity.toString(),
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                          const SizedBox(width: 15),
                                          // Increase quantity button
                                          CircleAvatar(
                                            radius: 15,
                                            backgroundColor: Colors.blue,
                                            child: IconButton(
                                              iconSize: 15,
                                              onPressed: () =>
                                                  addProduct(cartItem),
                                              icon: const Icon(Icons.add),
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  // Product Price
                                  Text(
                                    "\$${(cartItem.price * cartItem.quantity).toStringAsFixed(0)}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),

                      // Checkout Button
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Checkout(
                                        total: totalCost,
                                      )));
                        },
                        child: Container(
                          width: 500,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 16),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "Checkout ${totalCost.toStringAsFixed(0)}",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Center(
                child: Column(
                children: [
                  Image.asset(
                    "assets/images/empty.png",
                    height: 400,
                  ),
                  const Text("No shoes selected"),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Front()));
                      },
                      child: const Text(
                        "shop here",
                        style: TextStyle(color: Colors.blue),
                      ))
                ],
              )));
  }
}
