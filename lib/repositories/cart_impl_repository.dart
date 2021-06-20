import 'dart:convert';
import 'dart:math';

import 'package:flutter_ecommerce/repositories/abstracts/cart_repository.dart';
import 'package:flutter_ecommerce/repositories/models/cart_model.dart';
import 'package:flutter_ecommerce/services/shopping_cart/cart_read_write_file.dart';

class CartImplRepository extends CartRepository {
  String _shoppingCart = '';
  final ShoppingCartStorage _shoppingCartStorage = ShoppingCartStorage();

  CartImplRepository()
  {
    _updateLocalShoppingCart();
  }

  _updateLocalShoppingCart()
  {
    _shoppingCartStorage.readObj().then((value) {
      _shoppingCart = value;
    });
  }

  Set<String> _convertToSet()
  {
    Set<String> set = Set.from(jsonDecode(_shoppingCart));
    return set;
  }

  @override
  emptyShoppingCart()
  {
    _shoppingCartStorage.writeObj('').then((value) {
      _updateLocalShoppingCart();
    });
  }

  @override
  addToCart(String reference)
  {
    if (!_shoppingCart.contains(reference))
    {
      String productToAdd = '';
      if (_shoppingCart.isNotEmpty)
      {
        productToAdd = _shoppingCart.substring(0, _shoppingCart.toString().length - 1) + ''', ''';
      }
      else
      {
        productToAdd = '''[''';
      }
      productToAdd = productToAdd + '''{"reference" : "$reference", "quantity" : 1}]''';
      _shoppingCartStorage.writeObj(productToAdd);
      _updateLocalShoppingCart();
    }
  }

  @override
  void getShoppingCart()
  {
  }
}