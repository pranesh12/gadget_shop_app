import 'package:gadget_shop/models/cart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartNotifier extends StateNotifier<List<Cart>> {
  CartNotifier() : super([]);

  // Add an item to the cart
  void addToCart(Cart item) {
    final existingIdx =
        state.indexWhere((cartItem) => cartItem.productId == item.productId);

    if (existingIdx >= 0) {
      // If item exists, increment its quantity
      final updatedCart = [...state];
      updatedCart[existingIdx] = Cart(
        productId: updatedCart[existingIdx].productId,
        title: updatedCart[existingIdx].title,
        thumbnail: updatedCart[existingIdx].thumbnail,
        brand: updatedCart[existingIdx].brand,
        price: updatedCart[existingIdx].price,
        quantity: updatedCart[existingIdx].quantity + 1,
      );

      state = updatedCart;
    } else {
      // If item doesn't exist, add it to the cart
      state = [...state, item];
    }
  }

  // Remove an item from the cart
  void removeFromCart(String id) {
    state = state.where((product) => product.productId != id).toList();
  }

  // Update the quantity of a specific item
  void updateQuantity(String id, int newQuantity) {
    final existingIdx =
        state.indexWhere((cartItem) => cartItem.productId == id);

    if (existingIdx >= 0) {
      final updatedCart = [...state];
      updatedCart[existingIdx] = Cart(
        productId: updatedCart[existingIdx].productId,
        title: updatedCart[existingIdx].title,
        thumbnail: updatedCart[existingIdx].thumbnail,
        brand: updatedCart[existingIdx].brand,
        price: updatedCart[existingIdx].price,
        quantity: newQuantity, // Update to the new quantity
      );

      state = updatedCart;
    }
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<Cart>>((ref) {
  return CartNotifier();
});
