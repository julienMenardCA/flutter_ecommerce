
import 'package:flutter/material.dart';

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
      body: const Center(child: null,)
    );
  }
}
