// lib/blocs/catalog_bloc.dart
import 'package:bloc/bloc.dart';
import '../models/products.dart';

class CatalogState {
  final List<Product> products;

  CatalogState(this.products);
}

class CatalogCubit extends Cubit<CatalogState> {
  CatalogCubit()
      : super(CatalogState([
          Product(
              name: 'Product 1',
              price: 20,
              imageUrl:
                  'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
          Product(
              name: 'Product 2',
              price: 30,
              imageUrl:
                  'https://images.unsplash.com/photo-1572635196237-14b3f281503f?q=80&w=1780&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
        ]));

  void setProducts(List<Product> products) {
    emit(CatalogState(products));
  }
}
