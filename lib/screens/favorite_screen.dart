import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/material.dart';


class FavoriteScreen extends StatefulWidget {
  final int index;

  const FavoriteScreen({Key? key, required this.index}) : super(key: key);

  @override
  _FavoriteScreen createState() => _FavoriteScreen();
}

class _FavoriteScreen extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => null,
            icon: const Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
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
              child: const DecoratedIcon(
                Icons.favorite,
                color: Colors.red,
                size: 40.0,
                  shadows: [
                  BoxShadow(
                      blurRadius: 3.0,
                      color: Colors.black26,
                      offset: Offset(0, 3.0)
                  )
                ]
              ),
            )
        ])
      ),
    );
  }

}