// lib/app_providers.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/catalog_bloc.dart';
import 'blocs/cart_bloc.dart';

final catalogCubitProvider = BlocProvider<CatalogCubit>(
  create: (context) => CatalogCubit(),
);

final cartCubitProvider = BlocProvider<CartCubit>(
  create: (context) => CartCubit(),
);
