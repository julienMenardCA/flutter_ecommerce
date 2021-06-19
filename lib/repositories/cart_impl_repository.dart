import 'dart:convert';

import 'package:flutter_ecommerce/repositories/abstracts/cart_repository.dart';
import 'package:flutter_ecommerce/repositories/models/cart_model.dart';
import 'package:flutter_ecommerce/services/shopping_cart/cart_read_write_file.dart';

class CartImplRepository extends CartRepository {
  List<dynamic> _shoppingCart = [];
  final ShoppingCartStorage _shoppingCartStorage = ShoppingCartStorage();

  CartImplRepository()
  {
    _updateLocalShoppingCart();
  }

  _updateLocalShoppingCart()
  {
    _shoppingCartStorage.readObj().then((value) {
      if (value != '')
      {
        _shoppingCart.add(jsonDecode(value));
      }
      else
      {
        _shoppingCart = [];
      }
    });
  }

  @override
  emptyShoppingCart() {
    _shoppingCartStorage.writeObj("").then((value) {
      _updateLocalShoppingCart();
    });
  }

  @override
  addToCart(String reference) {

    if (_shoppingCart.isEmpty || (_shoppingCart.isNotEmpty))
    {
      _addToShoppingCart(reference);
    }
  }

  _addToShoppingCart(String reference)
  {
    String productToAdd = '''{"reference" : "'$reference'", "quantity" : 1}''';
    _shoppingCartStorage.writeObj(productToAdd).then((value) {
      _updateLocalShoppingCart();
    });
  }

  @override
  List<CartModel> getShoppingCart() {
    print(_shoppingCart.length);
    return _shoppingCart.map((e) => CartModel(reference: e["reference"], quantity: e["quantity"])).toList();
  }
}