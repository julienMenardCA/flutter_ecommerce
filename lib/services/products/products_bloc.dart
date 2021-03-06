import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce/repositories/abstracts/product_repository.dart';

part 'products_event.dart';

part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepository _productsRepository;

  ProductsBloc(this._productsRepository) : super(ProductsInitial());

  @override
  Stream<ProductsState> mapEventToState(
    ProductsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
