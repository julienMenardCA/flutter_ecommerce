import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/config/data.dart';

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
                child: Row(
                  children: [
                    Center(
                      child: Text(data[index]["title"] as String),
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                data[index]["image_url"] as String),
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                //child: Text(data[index]["title"] as String),
              ),
            );
          }),
    );
  }
}
