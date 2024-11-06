import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kick_start/constants/api_endpoint.dart';
import 'package:kick_start/models/product.dart';
import 'package:kick_start/providers/product_provider.dart';
import 'package:kick_start/screens/cart_screen.dart';
import 'package:kick_start/screens/home.dart';
import 'package:kick_start/screens/login.dart';
import 'package:kick_start/screens/profile.dart';
import 'package:kick_start/screens/register.dart';
import 'package:kick_start/screens/search_screen.dart';
import 'package:kick_start/screens/store.dart';
import 'package:kick_start/widgets/carousel.dart';
import 'package:kick_start/widgets/category_list.dart';
import 'package:kick_start/widgets/home_appbar.dart';
import 'package:kick_start/widgets/product/product_card.dart';
import 'package:kick_start/widgets/product_card_skeleton.dart';
import 'package:kick_start/widgets/search_item.dart';
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
      debugPrint("Something went wrong");
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
                products.isEmpty
                    ? const ProductCardSkeleton()
                    : ProductCard(
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
