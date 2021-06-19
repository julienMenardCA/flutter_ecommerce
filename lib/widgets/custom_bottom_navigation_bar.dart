import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screens/favorite_screen.dart';
import 'package:flutter_ecommerce/screens/home_screen.dart';
import 'package:flutter_ecommerce/screens/product_screen.dart';
import 'package:flutter_ecommerce/screens/shopping_cart.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  late PageController _controller;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    setState(() => _currentIndex = widget.currentIndex);

    _controller = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
            scrollDirection: Axis.horizontal,
            controller: _controller,
            children: const [
              HomeScreen(),
              FavoriteScreen(
                index: 1,
              ),
              ListShoppingCart2(),
              ProductScreen(
                index: 2,
              ),
            ]),
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.lightBlue,
            unselectedItemColor: Colors.grey,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: "Favoris"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: "Panier"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.perm_identity), label: "Profil"),
            ],
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() => _currentIndex = index);
              _controller.animateToPage(_currentIndex,
                  duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
            }));
  }
}
