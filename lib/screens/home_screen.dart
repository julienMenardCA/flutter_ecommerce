
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/bootstrap.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text("Amazibaba"),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              // ignore: avoid_returning_null_for_void
              onPressed:() => null,
            ),
          ]
        ),
      body: Container(),
      
      bottomNavigationBar: Bootstrap(
        currentIndex:0 ,
      ),

    );
  }
}
