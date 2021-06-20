import 'dart:convert';

import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/repositories/cart_impl_repository.dart';
import 'package:flutter_ecommerce/repositories/models/product_model.dart';
import 'package:flutter_ecommerce/repositories/product_impl_repository.dart';
import 'package:flutter_ecommerce/services/shopping_cart/cart_read_write_file.dart';
import 'package:flutter_ecommerce/widgets/main_frame.dart';

class ListShoppingCart extends StatefulWidget {
  const ListShoppingCart({Key? key}) : super(key: key);

  @override
  _ListShoppingCart createState() => _ListShoppingCart();
}

class _ListShoppingCart extends State<ListShoppingCart> {
  String _cartRetrieved = "";
  final CartImplRepository _cartImplRepository = CartImplRepository();
  final ProductImplRepository _productImplRepository = ProductImplRepository();
  final ShoppingCartStorage _shoppingCartStorage = ShoppingCartStorage(fileName: "shopping_cart.json");

  @override
  void initState() {
    super.initState();
    _shoppingCartStorage.readObj().then((String value) {
      setState(() {
        _cartRetrieved = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> references = [];
    if (_cartRetrieved.isNotEmpty) {
      for (int i = 0; i < jsonDecode(_cartRetrieved).length; i++) {
        references.add(jsonDecode(_cartRetrieved)[i]["reference"]);
      }
    }
    List<ProductModel> _shoppingCart = _productImplRepository
        .getProductsWithReferences(references);
    _cartImplRepository.getShoppingCart();
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white54,
          ),
          actions: [
            IconButton(
              onPressed: () {
                if (_shoppingCart.isNotEmpty) {
                  _cartImplRepository.emptyShoppingCart();
                  final snackBar = SnackBar(content: Text('Panier vidé'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                          const MainFrame(currentIndex: 2)));
                }
              },
              icon: const Icon(Icons.remove_shopping_cart),
            )
          ],
        ),
        body: _shoppingCart.isEmpty ? EmptyCartLayout() : NotEmptyCartLayout(shoppingCart: _shoppingCart),);
  }
}

class EmptyCartLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(top: 200.0, right: 80.0, left: 80.0),
            child: const Text(
              "Vous n'avez pas encore de produit dans votre panier \n \n"
                  "Rendez-vous dans nos articles puis appuyer sur l'icon de cadit pour ajouter des produits dans votre panier",
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: const DecoratedIcon(Icons.shopping_cart,
                color: Colors.black,
                size: 40.0,
                shadows: [
                  BoxShadow(
                      blurRadius: 3.0,
                      color: Colors.black26,
                      offset: Offset(0, 3.0))
                ]),
          )
        ]));
  }
}

class NotEmptyCartLayout extends StatelessWidget {
  final List<ProductModel> shoppingCart;
  const NotEmptyCartLayout({Key? key, required this.shoppingCart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      physics: const BouncingScrollPhysics(),
      itemCount: shoppingCart.length,
      itemBuilder: (context, index) =>
          Container(
            height: 150,
            margin: const EdgeInsets.all(20.0),
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: ListTile(
                leading: Image.network(shoppingCart[index].imageUrl),
                title: Text(shoppingCart[index].title),
                subtitle: Text(shoppingCart[index].description),
                trailing: const Icon(Icons.more_vert),
                isThreeLine: true,
              ),
            ),
          ),
    );
  }
}
