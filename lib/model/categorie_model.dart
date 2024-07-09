// import 'package:task/model/product_model.dart';

// class CategorieModel {
//   String id;
//   String name;
//   final List<ProductModel> products;

//   CategorieModel({
//     required this.id,
//     required this.name,
//     required this.products,
//   });
//   factory CategorieModel.fromJson(Map<String, dynamic> json) {
//     return CategorieModel(
//         id: json['id'], name: json['name'], products: );
//   }
// }

import 'package:task/model/product_model.dart';

class Category {
  final int id;
  final String name;
  final List<Product> products;

  Category({
    required this.id,
    required this.name,
    required this.products,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      products: (json['product'] as List)
          .map((product) => Product.fromJson(product))
          .toList(),
      // products: List<Product>.from(
      //   json['product'].map((product) => Product.fromJson(product)),
      // ),
    );
  }
}
