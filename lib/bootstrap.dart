import 'package:flutter_ecommerce/screens/home_screen.dart';
import 'package:flutter/material.dart';

class Bootstrap extends StatefulWidget {
  final int currentIndex;

  Bootstrap({
    Key? key,
    required this.currentIndex,
  }) :super(key: key);

  @override
  _BootstrapState createState() => _BootstrapState();
}

class _BootstrapState extends State<Bootstrap>{
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    PageController(initialPage: widget.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon (Icons.home),
          label: "Accueil"
        ),
        BottomNavigationBarItem(
          icon: Icon (Icons.favorite),
          label: "Favoris"
        ),
        BottomNavigationBarItem(
          icon: Icon (Icons.shopping_cart),
          label: "Panier"
        ),
        BottomNavigationBarItem(
          icon: Icon (Icons.perm_identity),
          label: "Profil"
        ),
      ],
      currentIndex: widget.currentIndex,
      );
  }
}