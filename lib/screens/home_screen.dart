
import 'package:flutter/material.dart';

class Home_screen extends StatelessWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Amalibaba"),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed:() => null,
            ),
          ]
        ),
      body: Center(child: null,)
    );
  }
}
