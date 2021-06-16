import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/config/data.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white54,
          ),
          actions: [
            IconButton(
              onPressed: () => null,
              icon: const Icon(Icons.shopping_cart),
            )
          ],
        ),
        body: SlidingUpPanel(
            maxHeight: 500.0,
            minHeight: 200.0,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0)),
            panel: Center(
              child: Column(
                children: [
                  Container(
                    width: 150.0,
                    height: 5.0,
                    color: Colors.black,
                    margin: const EdgeInsets.only(top: 15.0),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    width: 350.0,
                    child: Row(
                      children: [
                        Text(
                          "${data[0]['title']}",
                          textAlign: TextAlign.left,
                          style: const TextStyle(fontSize: 24.0),
                        ),
                      ],
                    ),
                  ),
                  Row(children: [
                    Container(
                      margin: const EdgeInsets.only(top: 50.0),
                      child: Text(
                        "${data[0]['price']} €",
                        style: const TextStyle(fontSize: 18.0),
                      ),
                    )
                  ])
                ],
              ),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 280.0, top: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(data[0]['image_url'] as String))),
                ),
              ),
            )));
  }
}
