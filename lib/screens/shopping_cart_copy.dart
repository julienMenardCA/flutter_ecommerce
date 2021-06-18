import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/config/data.dart';
import 'package:hexcolor/hexcolor.dart';


class ListShoppingCart extends StatefulWidget {
  const ListShoppingCart({
    Key ? key
  }): super(key: key);

  @override
  _ListShoppingCart createState() => _ListShoppingCart();
}

class _ListShoppingCart extends State < ListShoppingCart > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
          physics: BouncingScrollPhysics(),
          itemCount: data.length,
          itemBuilder: (context, index) => Container(
            height: 150,
            margin: const EdgeInsets.all(20.0),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 33,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            left: 0.0,
                            child: Image.network(
                              data[index]["image_url"] as String)
                          ),
                          Positioned.fill(
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                splashColor: HexColor("#c8dbef"),
                                onTap: () => {
                                  print("click")
                                },
                              )
                            )
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 66,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 25,
                            child: Center(child: Text(data[index]["title"] as String))
                          ),
                          Expanded(
                            flex: 50,
                            child: Center(child: Text(data[index]["description"] as String))
                          ),
                          Expanded(
                            flex: 25,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    IconButton(
                                      onPressed: () => null,
                                      icon: const Icon(Icons.remove),
                                    ),
                                    Text('1'),
                                    IconButton(
                                      onPressed: () => null,
                                      icon: const Icon(Icons.add),
                                    ),
                                  ], 
                                  ),
                                  Text(data[index]["price"]?.toString() ?? ''),
                                ]
                              ))
                          ),
                        ],
                      )
                    )
                  ],
                )
              ),
          ),
      )
    );
  }
}