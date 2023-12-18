// lib/screens/cart_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shopping Cart')),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final cartItems = state.cartItems;

          // Calculate the total price
          final double totalPrice = cartItems.fold<double>(
            0.0,
            (previousValue, cartItem) => previousValue + cartItem.product.price * cartItem.quantity,
          );

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final cartItem = cartItems[index];
                    return ListTile(
                      title: Text(cartItem.product.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Quantity: ${cartItem.quantity}'),
                          Text('Price per item: \$${cartItem.product.price.toStringAsFixed(2)}'),
                          Text(
                              'Total Price: \$${(cartItem.product.price * cartItem.quantity).toStringAsFixed(2)}'),
                        ],
                      ),
                      leading: SizedBox(
                        width: 80,
                        child: Image.network(
                          cartItem.product.imageUrl,
                          fit: BoxFit.contain,
                        ),
                      ), // Display the image
                      trailing: IconButton(
                        icon: const Icon(Icons.remove_shopping_cart),
                        onPressed: () {
                          // remove the product from the cart
                          context.read<CartCubit>().removeFromCart(cartItem.product);
                        },
                      ),
                    );
                  },
                ),
              ),
              // Display the total price at the bottom of the screen
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Total Price: \$${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
