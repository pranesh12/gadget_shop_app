import 'package:gadget_shop/models/cart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartNotifier extends StateNotifier<List<Cart>> {
  CartNotifier() : super([]);

  void addTocart(Cart item) {
    final exsitingIdx =
        state.indexWhere((cartItem) => cartItem.productId == item.productId);

    if (exsitingIdx >= 0) {
      final updatedCart = [...state];
      updatedCart[exsitingIdx] = Cart(
          productId: updatedCart[exsitingIdx].productId,
          title: updatedCart[exsitingIdx].title,
          thumbnail: updatedCart[exsitingIdx].thumbnail,
          brand: updatedCart[exsitingIdx].brand,
          price: updatedCart[exsitingIdx].price);

      state = updatedCart;
    } else {
      state = [...state, item];
    }
  }

  void removeFromCart(String id) {
    state = state.where((product) => product.productId != id).toList();
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<Cart>>((ref) {
  return CartNotifier();
});
