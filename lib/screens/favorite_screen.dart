import 'dart:convert';

import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/repositories/favorite_impl_repository.dart';
import 'package:flutter_ecommerce/repositories/models/product_model.dart';
import 'package:flutter_ecommerce/screens/product_screen.dart';
import 'package:flutter_ecommerce/services/shopping_cart/cart_read_write_file.dart';
import 'package:flutter_ecommerce/repositories/product_impl_repository.dart';
import 'package:flutter_ecommerce/widgets/main_frame.dart';
import 'package:hexcolor/hexcolor.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreen createState() => _FavoriteScreen();
}

class _FavoriteScreen extends State<FavoriteScreen> {
  String _favoritesRetrieved = "";
  final FavoriteImplRepository _favoriteImplRepository = FavoriteImplRepository();
  final ProductImplRepository _productImplRepository = ProductImplRepository();
  final ShoppingCartStorage _favoritesStorage = ShoppingCartStorage(fileName: "favorites.json");

  @override
  void initState() {
    super.initState();
    _favoritesStorage.readObj().then((String value) {
      setState(() {
        _favoritesRetrieved = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> references = [];
    if (_favoritesRetrieved.isNotEmpty) {
      for (int i = 0; i < jsonDecode(_favoritesRetrieved).length; i++) {
        references.add(jsonDecode(_favoritesRetrieved)[i]["reference"]);
      }
    }
    List<ProductModel> _favorites = _productImplRepository
        .getProductsWithReferences(references);
    _favoriteImplRepository.getFavorites();
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(
          onPressed: () {
            if (_favorites.isNotEmpty) {
              _favoriteImplRepository.emptyFavorites();
              final snackBar = SnackBar(content: Text('Favoris vidé'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                      const MainFrame(currentIndex: 1)));
            }
          },
          icon: const Icon(Icons.delete_forever),
        )],
      ),
      body: _favorites.isEmpty ? EmptyFavorites() : NotEmptyFavorites(favorites: _favorites, favoritesRetrieved: _favoritesRetrieved, productImplRepository: _productImplRepository, favoriteImplRepository: _favoriteImplRepository,));
  }
}

class NotEmptyFavorites extends StatelessWidget {
  final List<ProductModel> favorites;
  final String favoritesRetrieved;
  final FavoriteImplRepository favoriteImplRepository;
  final ProductImplRepository productImplRepository;

  const NotEmptyFavorites({Key? key, required this.favorites, required this.favoritesRetrieved, required this.productImplRepository, required this.favoriteImplRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 0),
        itemCount: favorites.length,
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
                        child: GestureDetector(
                          onTap: () {

                          },
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
                          ),
                        )),
                    Expanded(
                      child: Stack(
                        children: [
                          Positioned.fill(
                              bottom: 0.0,
                              child: Image.network(favorites[index]
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
                    Text(favorites[index]
                        .title),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(favorites[index].price
                              .toStringAsFixed(2) +
                              '€'),
                        ),
                        IconButton(
                          icon: favoritesRetrieved.contains(productImplRepository.getProductByIndex(index).reference) ? const Icon(Icons.shopping_cart) : const Icon(Icons.shopping_cart_outlined),
                          onPressed: () {
                            var snackBar = SnackBar(content: Text(''));
                            if (!favoritesRetrieved.contains(productImplRepository.getProductByIndex(index).reference))
                            {
                              favoriteImplRepository.addToFavorites(
                                  productImplRepository
                                      .getProductByIndex(index)
                                      .reference);
                              snackBar = const SnackBar(content: Text('Produit ajouté aux favoris'));
                            }
                            else
                            {
                              snackBar = const SnackBar(content: Text('Vous avez déjà ajouté ce produit dans vos favoris'));
                            };
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          },
                        )
                      ],
                    )
                  ],
                )),
          );
        });
  }
}

class EmptyFavorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(top: 200.0, right: 80.0, left: 80.0),
            child: const Text(
              "Vous n'avez pas encore de produit en favoris \n \n"
                  "Rendez-vous dans nos articles puis mettez un like pour ajouter des produits dans vos favoris",
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: const DecoratedIcon(Icons.favorite,
                color: Colors.red,
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
