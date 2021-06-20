import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/config/data.dart';
import 'package:flutter_ecommerce/repositories/cart_impl_repository.dart';
import 'package:flutter_ecommerce/repositories/product_impl_repository.dart';
import 'package:flutter_ecommerce/services/shopping_cart/cart_read_write_file.dart';

class ListShoppingCart extends StatefulWidget {
  const ListShoppingCart({Key? key}) : super(key: key);

  @override
  _ListShoppingCart createState() => _ListShoppingCart();
}

class _ListShoppingCart extends State<ListShoppingCart> {
  String _cartRetrieved = "";
  final CartImplRepository _cartImplRepository = CartImplRepository();
  final ProductImplRepository _productImplRepository = ProductImplRepository();
  final ShoppingCartStorage _shoppingCartStorage = ShoppingCartStorage();

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
    if(_cartRetrieved.isNotEmpty) {
      for (int i = 0; i < jsonDecode(_cartRetrieved).length; i++) {
        references.add(jsonDecode(_cartRetrieved)[i]["reference"]);
      }
      //print(_productImplRepository.getProductsWithReferences(references)[0].title);
    }
    _cartImplRepository.getShoppingCart();
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white54,
          ),
          actions: [
            IconButton(
              onPressed: () => {_cartImplRepository.emptyShoppingCart()},
              icon: const Icon(Icons.delete),
            )
          ],
        ),
        //appBar: AppBar(),
        body: ListView.builder(
          padding: const EdgeInsets.all(8),
          physics: const BouncingScrollPhysics(),
          // itemCount: _cartImplRepository.getShoppingCart().length,
          itemCount: data.length,
          itemBuilder: (context, index) => Container(
            height: 150,
            margin: const EdgeInsets.all(20.0),
            child: Card(
              clipBehavior: Clip.antiAlias,
              //child: Column(
              //children: [
              child: ListTile(
                leading: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {},
                  child: Container(
                    width: 150,
                    height: 150,
                    padding: const EdgeInsets.symmetric(vertical: 1.0),
                    alignment: Alignment.center,
                    child: Image.network(data[index]["image_url"] as String),
                  ),
                ),
                title: Center(child: Text(data[index]["title"] as String)),
                subtitle:
                    Center(child: Text(data[index]["description"] as String)),
                trailing: const Icon(Icons.more_vert),
              ),
            ),
          ),
        ));
  }
}
