import 'package:flutter_ecommerce/config/shopping_cart.dart';
import 'package:flutter_ecommerce/repositories/abstracts/cart_repository.dart';
import 'package:flutter_ecommerce/repositories/models/cart_model.dart';

class CartImplRepository extends CartRepository {
  @override
  addInCart(String reference) {

  }

  @override
  List<CartModel> getShoppingCart() {
    return shoppingCart.map((e) => CartModel(reference: e["reference"])).toList();
  }
  
}