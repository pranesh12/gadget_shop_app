import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kick_start/constants/api_endpoint.dart';
import 'package:kick_start/providers/cart_provider.dart';
import 'package:kick_start/screens/front.dart';
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

  String firstName = "";
  String lastName = "";
  String userId = "";
  String token = "";
  String email = "";
  bool isLoading = false; // Loading state

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
    String? storedToken = prefs.getString('token');
    String? storedEmail = prefs.getString('email');

    setState(() {
      firstName = storedFirstName ?? "";
      lastName = storedLastName ?? "";
      userId = storedid ?? "";
      token = storedToken ?? "";
      email = storedEmail ?? "";
    });
  }

  final Uri url = Uri.parse("${ApiEndpoint.baseUrl}/order/add");

  Future<void> _handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      final total = widget.total;

      // Show loading spinner
      setState(() {
        isLoading = true;
      });

      final orderData = {
        'user': userId,
        'name': '$firstName $lastName',
        'email': email,
        'address': _address.text,
        'phone': _phone.text,
        'totalAmount': total,
        'cart': cart,
      };

      try {
        final res = await http.post(
          url,
          headers: <String, String>{
            'Content-type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(orderData),
        );

        // Hide loading spinner
        setState(() {
          isLoading = false;
        });

        if (res.statusCode == 200) {
          // Show success dialog
          _showSuccessDialog();
        } else {
          // Show failure dialog
          _showFailureDialog();
        }
      } catch (e) {
        // Hide loading spinner and show failure dialog in case of an error
        setState(() {
          isLoading = false;
        });
        _showFailureDialog();
      }
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Success"),
          content: const Text("Order successfully created."),
          actions: [
            TextButton(
              onPressed: () {
                // Clear form fields
                _address.clear();
                _phone.clear();

                Navigator.of(context).pop(); // Close the dialog

                // Navigate to another route (e.g., OrderSummary page)
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const Front(),
                  ),
                );
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void _showFailureDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Error"),
          content: const Text("Failed to create the order. Please try again."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartItems = ref.watch(cartProvider);

    cart = cartItems
        .map((item) => {'productId': item.productId, 'quantity': item.quantity})
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
      ),
      body: Center(
        child: Container(
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

                  // Submit button with a spinner
                  Container(
                    height: 50,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.blue,
                    ),
                    child: InkWell(
                      onTap: isLoading
                          ? null
                          : _handleSubmit, // Disable button while loading
                      child: Center(
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                "Confirm Order",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
