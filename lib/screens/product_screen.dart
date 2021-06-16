import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/repositories/product_impl_repository.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ProductScreen extends StatefulWidget {
  final int index;

  const ProductScreen({Key? key, required this.index}) : super(key: key);

  @override
  _ProductScreen createState() => _ProductScreen();
}

class _ProductScreen extends State<ProductScreen> {
  final ProductImplRepository _productImplRepository = ProductImplRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white54,
          ),
          actions: [
            IconButton(
              onPressed: () => null,
              icon: const Icon(Icons.shopping_cart),
            )
          ],
        ),
        body: SlidingUpPanel(
            maxHeight: 500.0,
            minHeight: 200.0,
            padding: const EdgeInsets.all(15.0),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0)),
            panel: Center(
              child: Column(
                children: [
                  Container(
                    width: 150.0,
                    height: 5.0,
                    color: Colors.black,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      _productImplRepository.getProductById(widget.index).title,
                      style: const TextStyle(fontSize: 28.0),
                    ),
                  ),
                  Row(children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        _productImplRepository
                                .getProductById(widget.index)
                                .price
                                .toString() + '€',
                        style: const TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Container(
                      child: const Text(
                        "Mis en favori par 1,2k visiteurs",
                      ),
                    ),
                    IconButton(
                      onPressed: () => null,
                      icon: const Icon(Icons.favorite, color: Colors.red,),
                    )
                  ])
                ],
              ),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 280.0, top: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(_productImplRepository
                              .getProductById(widget.index)
                              .imageUrl))),
                ),
              ),
            )));
  }
}
