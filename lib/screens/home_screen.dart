
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/widgets/custom_bottom_navigation_bar.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              // ignore: avoid_returning_null_for_void
              onPressed:() => null,
            ),
          ]
        ),
      body: Container(),

      bottomNavigationBar: const CustomBottomNavigationBar(
        currentIndex:0 ,
      ),

    );
  }
}
