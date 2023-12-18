// lib/blocs/cart_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:machine_test_ecom/screens/alert.dart';
import '../models/cart.dart';
import '../models/products.dart';

class CartState {
  final List<CartItem> cartItems;

  CartState(this.cartItems);
}

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState([]));

  void addToCart(CartItem newItem) {
    final currentCart = state.cartItems;
    final existingIndex = currentCart.indexWhere((item) => item.product == newItem.product);

    if (existingIndex != -1) {
      // If the item is already in the cart, update the quantity
      currentCart[existingIndex].quantity += newItem.quantity;
    } else {
      // If the item is not in the cart, add it
      currentCart.add(newItem);
    }
    Alert.showToast('Item added to cart');

    emit(CartState([...currentCart]));
  }

  void removeFromCart(Product product) {
    final currentCart = state.cartItems;
    currentCart.removeWhere((item) => item.product == product);
    Alert.showToast('Item removed from cart');

    emit(CartState([...currentCart]));
  }
}
