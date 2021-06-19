import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
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
        maxHeight: 350.0,
        minHeight: 200.0,
        padding: const EdgeInsets.all(15.0),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50.0), topRight: Radius.circular(50.0)),
        panel: Center(
          child: Column(
            children: [
              Container(
                width: 150.0,
                height: 5.0,
                color: Colors.black,
              ),
              Container(
                margin: const EdgeInsets.only(top: 15.0),
                child: Text(
                  _productImplRepository.getProductByIndex(widget.index).title,
                  style: const TextStyle(fontSize: 24.0),
                ),
              ),
              Row(children: [
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    _productImplRepository
                            .getProductByIndex(widget.index)
                            .price
                            .toString() +
                        '€',
                    style: const TextStyle(fontSize: 26.0),
                  ),
                ),
                Container(
                  width: 85.0,
                  margin: const EdgeInsets.only(left: 120.0, top: 20.0),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 15.0),
                    child: const DecoratedIcon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 40.0,
                      shadows: [
                        BoxShadow(
                            blurRadius: 3.0,
                            color: Colors.black26,
                            offset: Offset(0, 3.0))
                      ],
                    )
                ),
              ]),
              Row(children: [
                Container(
                    margin: const EdgeInsets.all(15.0),
                    width: 60.0,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.black54),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: IconButton(
                      onPressed: () => null,
                      icon: const Icon(Icons.shopping_cart),
                    )),
                Container(
                    width: 220.0,
                    height: 42.0,
                    margin: const EdgeInsets.only(left: 20.0),
                    decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: const Center(
                      child: Text(
                        "BUY NOW",
                        style: TextStyle(fontSize: 22.0, color: Colors.white),
                      ),
                    ))
              ]),
              Container(
                  width: 100.0,
                  margin: const EdgeInsets.all(30.0),
                  child: const Text(
                    "Description :",
                    style: TextStyle(fontSize: 16),
                  )),
              Container(
                margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: Text(
                  _productImplRepository
                      .getProductByIndex(widget.index)
                      .description
                      .toString(),
                  style: const TextStyle(fontSize: 14.0),
                ),
              ),
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
                          .getProductByIndex(widget.index)
                          .imageUrl))),
            ),
          ),
        ),
      ),
    );
  }
}
