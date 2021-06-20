import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/config/data.dart';
import 'package:flutter_ecommerce/repositories/abstracts/product_repository.dart';
import 'package:flutter_ecommerce/repositories/models/product_model.dart';

class ProductImplRepository extends ProductRepository {
  @override
  List<ProductModel> getAllProducts() {
    return data
        .map((e) => ProductModel(
            objectId: e["object_id"]! as int,
            title: e["title"]! as String,
            imageUrl: e["image_url"]! as String,
            price: e["price"]! as double,
            description: e["description"]! as String,
            reference: e["reference"]! as String,
            stock: e["stock"]! as int))
        .toList();
  }

  @override
  ProductModel getProductByIndex(int index) {
    return ProductModel(
        objectId: data[index]["object_id"]! as int,
        title: data[index]["title"]! as String,
        imageUrl: data[index]["image_url"]! as String,
        price: data[index]["price"]! as double,
        description: data[index]["description"]! as String,
        reference: data[index]["reference"]! as String,
        stock: data[index]["stock"]! as int);
  }

  @override
  List<ProductModel> getProductsWithReferences(List<String> references) {
    List<ProductModel> products = [];
    List<int> indexes = [];

    data.forEach((element) {
      for (int i = 0; i < references.length; i++) {
        if (element["reference"] == references[i]) {
          indexes.add(data.indexOf(element));
        }
      }
    });

    for (int i = 0; i < indexes.length; i++) {
      products.add(getProductByIndex(indexes[i]));
    }

    return products;
  }
}
