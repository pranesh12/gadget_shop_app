import 'package:gadget_shop/models/product.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// StateNotifier to manage the list of products
class ProductNotifier extends StateNotifier<List<Product>> {
  ProductNotifier() : super([]);

  // Load products
  void setProducts(List<Product> products) {
    state = products;
  }

  List<Product> searchProducts(String query) {
    return state
        .where((product) =>
            product.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  // Add more methods to modify the state (e.g., filter, add, remove products)
}

final productProvider =
    StateNotifierProvider<ProductNotifier, List<Product>>((ref) {
  return ProductNotifier();
});
