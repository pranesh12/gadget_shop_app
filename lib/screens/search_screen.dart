import 'package:flutter/material.dart';
import 'package:kick_start/models/product.dart'; // Assuming you have a Product model
import 'package:kick_start/providers/product_provider.dart'; // Assuming you have a ProductProvider for fetching products
import 'package:kick_start/screens/product_details.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends ConsumerState<SearchScreen> {
  String searchTerm = '';
  List<Product> searchResults = [];

  void searchProducts(String query) {
    final productNotifier = ref.read(productProvider.notifier);
    searchResults = productNotifier.searchProducts(query);
    setState(() {}); // Refresh UI with the updated search results
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: const InputDecoration(
            hintText: "Search products...",
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.black),
          ),
          style: const TextStyle(color: Colors.black),
          onChanged: (value) {
            searchTerm = value;
            searchProducts(value);
          },
          onSubmitted: (value) {
            searchProducts(value); // Search when the user submits a query
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              searchProducts(searchTerm); // Search on button press
            },
          ),
        ],
      ),
      body: searchResults.isEmpty
          ? const Center(child: Text("No products found."))
          : ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final product = searchResults[index];
                return ListTile(
                  leading: Image.network(
                    product.thumbnail,
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(product.title),
                  subtitle: Text("\$${product.price}"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProductDetails(product: product)));
                  },
                );
              },
            ),
    );
  }
}
