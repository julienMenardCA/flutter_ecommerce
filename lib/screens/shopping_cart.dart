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
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.arrow_drop_down_circle),
                  title: const Text('Card title 1'),
                  subtitle: Text(
                    'Secondary Text',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    FlatButton(
                      textColor: const Color(0xFF6200EE),
                      onPressed: () {
                        // Perform some action
                      },
                      child: const Text('ACTION 1'),
                    ),
                    FlatButton(
                      textColor: const Color(0xFF6200EE),
                      onPressed: () {
                        // Perform some action
                      },
                      child: const Text('ACTION 2'),
                    ),
                  ],
                ),
                Image.asset('assets/card-sample-image.jpg'),
                Image.asset('assets/card-sample-image-2.jpg'),
              ],
            ),
          ),
          ),
      )
    );
  }
}