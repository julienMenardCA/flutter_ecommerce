import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/config/data.dart';
import 'package:flutter_ecommerce/repositories/cart_impl_repository.dart';

class ListShoppingCart2 extends StatefulWidget {
  const ListShoppingCart2({Key? key}) : super(key: key);

  @override
  _ListShoppingCart2 createState() => _ListShoppingCart2();
}

class _ListShoppingCart2 extends State<ListShoppingCart2> {
  final CartImplRepository _cartImplRepository = CartImplRepository();
  @override
  Widget build(BuildContext context) {
    print(_cartImplRepository.getShoppingCart().length);
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white54,
          ),
          actions: [
            IconButton(
              onPressed: () => {_cartImplRepository.emptyShoppingCart()},
              icon: const Icon(Icons.delete),
            )
          ],
        ),
        //appBar: AppBar(),
        body: ListView.builder(
      padding: const EdgeInsets.all(8),
      physics: const BouncingScrollPhysics(),
      itemCount: _cartImplRepository.getShoppingCart().length,
      itemBuilder: (context, index) => Container(
        height: 150,
        margin: const EdgeInsets.all(20.0),
        child: Card(
          clipBehavior: Clip.antiAlias,
          //child: Column(
          //children: [
          child: ListTile(
            leading: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {},
              child: Container(
                width: 150,
                height: 150,
                padding: const EdgeInsets.symmetric(vertical: 1.0),
                alignment: Alignment.center,
                child: Image.network(data[index]["image_url"] as String),
              ),
            ),
            title: Center(child: Text(data[index]["title"] as String)),
            subtitle: Center(child: Text(data[index]["description"] as String)),
            trailing: const Icon(Icons.more_vert),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: Text(data[index]["description"] as String,
          //             style: TextStyle(color: Colors.black.withOpacity(0.6)),
          //           ),
        ),
        // ButtonBar(
        //   alignment: MainAxisAlignment.start,
        //   children: [
        //     FlatButton(
        //       textColor: const Color(0xFF6200EE),
        //       onPressed: () {
        //         // Perform some action
        //       },
        //       child: const Text('ACTION 1'),
        //     ),
        //     FlatButton(
        //       textColor: const Color(0xFF6200EE),
        //       onPressed: () {
        //         // Perform some action
        //       },
        //       child: const Text('ACTION 2'),
        //     ),
        //   ],
        // ),
        // Image.asset('assets/card-sample-image.jpg'),
        // Image.asset('assets/card-sample-image-2.jpg'),
        //],
        //),
        //),
      ),
    ));
  }
}
