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
      body: const Center(
        child: Text(
          "Vous n'avez pas encore de produit en favoris",
          style: TextStyle(fontSize: 15)
        )
      ),
    );
  }

}