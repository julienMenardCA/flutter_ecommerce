import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/config/data.dart';
import 'package:hexcolor/hexcolor.dart';

class ListProducts extends StatefulWidget {
  const ListProducts({Key? key}) : super(key: key);

  @override
  _ListProducts createState() => _ListProducts();
}

class _ListProducts extends State<ListProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 0),
          itemCount: data.length,
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
                      Expanded(
                        child: Stack(
                          children: [
                            Positioned.fill(
                              bottom: 0.0,
                                child: Image.network(
                                    data[index]["image_url"] as String)
                            ),
                            Positioned.fill(
                                child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      splashColor: HexColor("#c8dbef"),
                                      onTap: () => {print("click")},
                                    ))),
                          ],
                        ),
                      ),
                      Text(data[index]["title"] as String),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(data[index]["price"]?.toString() ?? ''),
                          ),
                          IconButton(
                            onPressed: () => null,
                            icon: const Icon(Icons.shopping_cart),
                          )
                        ],
                      )
                    ],
                  )),
            );
          }),
    );
  }
}
