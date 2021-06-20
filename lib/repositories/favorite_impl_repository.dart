import 'dart:convert';

import 'package:flutter_ecommerce/services/shopping_cart/cart_read_write_file.dart';

import 'abstracts/favorite_repository.dart';

class FavoriteImplRepository extends FavoriteRepository {
  String _favorites = '';
  final ShoppingCartStorage _favoriteStorage = ShoppingCartStorage(fileName: "favorites.json");

  FavoriteImplRepository()
  {
    _updateLocalFavorites();
  }

  _updateLocalFavorites()
  {
    _favoriteStorage.readObj().then((value) {
      _favorites = value;
    });
  }

  @override
  emptyFavorites()
  {
    _favoriteStorage.writeObj('').then((value) {
      _updateLocalFavorites();
    });
  }

  @override
  addToFavorites(String reference)
  {
    if (!_favorites.contains(reference))
    {
      String productToAdd = '';
      if (_favorites.isNotEmpty)
      {
        productToAdd = _favorites.substring(0, _favorites.toString().length - 1) + ''', ''';
      }
      else
      {
        productToAdd = '''[''';
      }
      productToAdd = productToAdd + '''{"reference" : "$reference", "quantity" : 1}]''';
      _favoriteStorage.writeObj(productToAdd);
      _updateLocalFavorites();
    }
  }

  @override
  void getFavorites()
  {
  }
}