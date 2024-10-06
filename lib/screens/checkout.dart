import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gadget_shop/constants/api_endpoint.dart';
import 'package:gadget_shop/providers/cart_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Checkout extends ConsumerStatefulWidget {
  final double total;
  const Checkout({super.key, required this.total});

  @override
  CheckoutState createState() => CheckoutState();
}

class CheckoutState extends ConsumerState<Checkout> {
  late List<Map<String, dynamic>> cart;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _email = TextEditingController();
  String firstName = "";
  String lastName = "";
  String userId = "";
  int cartItemCount = 0;
  late SharedPreferences prefs;
  @override
  void initState() {
    super.initState();
    _loadDataFromPrefs();
  }

  Future<void> _loadDataFromPrefs() async {
    prefs = await SharedPreferences.getInstance();
    String? storedFirstName = prefs.getString('firstName');
    String? storedLastName = prefs.getString('lastName');
    String? storedid = prefs.getString('id');

    setState(() {
      firstName = storedFirstName ?? "";
      lastName = storedLastName ?? "";
      userId = storedid ?? "";
    });
  }

  final Uri url = Uri.parse("${ApiEndpoint.baseUrl}/order/add");

  Future<void> _handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      // Process the form if validation is successful
      final orderData = {
        'user': userId,
        'name': firstName + lastName,
        'email': _email.text,
        'address': _address.text,
        'phone': _phone.text,
        'cart': cart,
      };

      print(orderData);

      try {
        final res = await http.post(
          url,
          headers: <String, String>{
            'Content-type': 'application/json',
          },
          // body: jsonEncode(),
        );

        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(content: Text('Processing Checkout')),
        // );
      } catch (e) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartItems = ref.watch(cartProvider);

    cart = cartItems
        .map((item) => {'productId': item.productId, 'quantity': item.quantity})
        .toList();

    print(cart);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Address field
                TextFormField(
                  controller: _address,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: "Address",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.location_on),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Phone number field with Bangladeshi phone number validation
                TextFormField(
                  controller: _phone,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: "Phone",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    } else if (!RegExp(r'^(?:\+88|88)?01[3-9]\d{8}$')
                        .hasMatch(value)) {
                      return 'Please enter a valid Bangladeshi phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Email field
                TextFormField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Submit button
                Container(
                  height: 50,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.blue,
                  ),
                  child: InkWell(
                    onTap: _handleSubmit, // Trigger the signup function
                    child: const Center(
                      child: Text(
                        "Confirm Order",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
