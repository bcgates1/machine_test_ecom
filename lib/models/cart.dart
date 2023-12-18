// lib/models/cart.dart

import 'package:machine_test_ecom/models/products.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}
