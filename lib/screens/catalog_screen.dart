// lib/screens/catalog_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/catalog_bloc.dart';
import '../blocs/cart_bloc.dart';
import '../models/cart.dart';
import '../models/products.dart';
import 'cart_screen.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Catalog')),
      body: BlocBuilder<CatalogCubit, CatalogState>(
        builder: (context, state) {
          final catalog = state.products;

          return ListView.builder(
            itemCount: catalog.length,
            itemBuilder: (context, index) {
              Product product = catalog[index];
              return ListTile(
                leading: SizedBox(
                  width: 80,
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
                title: Text(product.name),
                subtitle: Text('\$${product.price}'),
                trailing: ElevatedButton(
                  onPressed: () {
                    // add the product to the cart
                    context.read<CartCubit>().addToCart(CartItem(product: product));
                  },
                  child: const Text('Add to Cart'),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the CartScreen when the floating action button is pressed
          Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
