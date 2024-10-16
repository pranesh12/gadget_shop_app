import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gadget_shop/constants/api_endpoint.dart';
import 'package:gadget_shop/models/product.dart';
import 'package:gadget_shop/providers/product_provider.dart';
import 'package:gadget_shop/screens/search_screen.dart';
import 'package:gadget_shop/widgets/carousel.dart';
import 'package:gadget_shop/widgets/category_list.dart';
import 'package:gadget_shop/widgets/home_appbar.dart';
import 'package:gadget_shop/widgets/product/product_card.dart';
import 'package:gadget_shop/widgets/search_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

class Front extends ConsumerStatefulWidget {
  const Front({super.key});

  @override
  FrontState createState() => FrontState();
}

class FrontState extends ConsumerState<Front> {
  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final response =
        await http.get(Uri.parse('${ApiEndpoint.baseUrl}/product/all'));

    if (response.statusCode == 200) {
      List<Product> products = (jsonDecode(response.body)['data'] as List)
          .map((productData) => Product.fromJson(productData))
          .toList();

      // Update the state with the fetched products
      ref.read(productProvider.notifier).setProducts(products);
    } else {
      // Handle error if needed
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(productProvider);

    return Scaffold(
      body: ListView(
        children: [
          Container(
            color: const Color.fromARGB(255, 75, 105, 255),
            child: Column(
              children: [
                const HomeAppBar(),
                const SizedBox(height: 10),
                InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchScreen()),
                      );
                    },
                    child: const SearchItem()),
                const SizedBox(height: 14),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 15, top: 10),
                  child: const Text(
                    "Categories",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                const CategoryList(),
                const SizedBox(height: 14),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(10),
                topStart: Radius.circular(10),
              ),
            ),
            child: Column(
              children: [
                const Carousel(),
                ProductCard(
                  products: products,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
