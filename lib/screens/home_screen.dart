import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/repositories/cart_impl_repository.dart';
import 'package:flutter_ecommerce/repositories/product_impl_repository.dart';
import 'package:flutter_ecommerce/screens/product_screen.dart';
import 'package:flutter_ecommerce/screens/shopping_cart.dart';
import 'package:flutter_ecommerce/services/shopping_cart/cart_read_write_file.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  String _cartRetrieved = "";
  final CartImplRepository _cartImplRepository = CartImplRepository();
  final ProductImplRepository _productImplRepository = ProductImplRepository();
  final ShoppingCartStorage _shoppingCartStorage = ShoppingCartStorage(fileName: "shopping_cart.json");

  bool _isInCart = false;

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
            _isInCart = _cartRetrieved.contains(_productImplRepository.getProductByIndex(index).reference);
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
                          child: const DecoratedIcon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 30.0,
                            shadows: [
                              BoxShadow(
                                  blurRadius: 3.0,
                                  color: Colors.black26,
                                  offset: Offset(0, 3.0))
                            ],
                          )),
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
                                    .toStringAsFixed(2) +
                                '€'),
                          ),
                          IconButton(
                            icon: _isInCart ? const Icon(Icons.shopping_cart) : const Icon(Icons.shopping_cart_outlined),
                            onPressed: () {
                              var snackBar = SnackBar(content: Text(''));
                              if (!_cartRetrieved.contains(_productImplRepository.getProductByIndex(index).reference))
                              {
                                _cartImplRepository.addToCart(
                                    _productImplRepository
                                        .getProductByIndex(index)
                                        .reference);
                                snackBar = const SnackBar(content: Text('Produit ajouté au panier'));
                              }
                              else
                              {
                                snackBar = const SnackBar(content: Text('Vous avez déjà ajouté ce produit dans votre panier'));
                              }
                              setState(() {
                                _isInCart = _cartRetrieved.contains(_productImplRepository.getProductByIndex(index).reference);
                              });
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
