import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/config/data.dart';
import 'package:flutter_ecommerce/repositories/cart_impl_repository.dart';

class ListShoppingCart extends StatefulWidget {
  const ListShoppingCart({Key? key}) : super(key: key);

  @override
  _ListShoppingCart createState() => _ListShoppingCart();
}

class _ListShoppingCart extends State<ListShoppingCart> {
  final CartImplRepository _cartImplRepository = CartImplRepository();

  @override
  Widget build(BuildContext context) {
    _cartImplRepository.getShoppingCart();
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
          // itemCount: _cartImplRepository.getShoppingCart().length,
          itemCount: data.length,
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
                subtitle:
                    Center(child: Text(data[index]["description"] as String)),
                trailing: const Icon(Icons.more_vert),
              ),
            ),
          ),
        ));
  }
}
