import 'package:flutter_ecommerce/config/data.dart';
import 'package:flutter_ecommerce/repositories/abstracts/product_repository.dart';
import 'package:flutter_ecommerce/repositories/models/product_model.dart';

class ProductImplRepository extends ProductRepository {
  @override
  List<ProductModel> getAllProducts() {
    return data.map((e) => ProductModel(objectId: e["object_id"]! as int, title: e["title"]! as String, imageUrl: e["image_url"]! as String,
        price: e["price"]! as double, description: e["description"]! as String, reference: e["reference"]! as String, stock: e["stock"]! as int)).toList();
  }

  @override
  ProductModel getProductById(int id) {
    return ProductModel(objectId: data[id]["object_id"]! as int, title: data[id]["title"]! as String, imageUrl: data[id]["image_url"]! as String,
        price: data[id]["price"]! as double, description: data[id]["description"]! as String, reference: data[id]["reference"]! as String, stock: data[id]["stock"]! as int);
  }

}