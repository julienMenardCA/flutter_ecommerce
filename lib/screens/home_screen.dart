import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/repositories/cart_impl_repository.dart';
import 'package:flutter_ecommerce/repositories/product_impl_repository.dart';
import 'package:flutter_ecommerce/screens/product_screen.dart';
import 'package:flutter_ecommerce/screens/shopping_cart_copy.dart';
import 'package:flutter_ecommerce/widgets/custom_bottom_navigation_bar.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  final ProductImplRepository _productImplRepository = ProductImplRepository();
  final CartImplRepository _cartImplRepository = CartImplRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("E-lcool"), actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          // ignore: avoid_returning_null_for_void
          onPressed: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ListShoppingCart(),
                ),
              );
            });
          },
        ),
      ]),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 0),
          itemCount: _productImplRepository.getAllProducts().length,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
              margin: const EdgeInsets.all(20.0),
              child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 90.0),
                        child: IconButton(
                          onPressed: () => null,
                          icon: const Icon(Icons.favorite,
                              color: Colors.red, size: 30.0),
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            Positioned.fill(
                                bottom: 0.0,
                                child: Image.network(_productImplRepository
                                    .getProductByIndex(index)
                                    .imageUrl)),
                            Positioned.fill(
                                child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      splashColor: HexColor("#c8dbef"),
                                      onTap: () => {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductScreen(index: index)),
                                        ),
                                      },
                                    ))),
                          ],
                        ),
                      ),
                      Text(_productImplRepository
                          .getProductByIndex(index)
                          .title),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(_productImplRepository
                                    .getProductByIndex(index)
                                    .price
                                    .toString() +
                                '€'),
                          ),
                          IconButton(
                            icon: const Icon(Icons.shopping_cart),
                            onPressed: () {
                              _cartImplRepository.addToCart(
                                  _productImplRepository
                                      .getProductByIndex(index)
                                      .reference);
                            },
                          )
                        ],
                      )
                    ],
                  )),
            );
          }),
    );
  }
}
