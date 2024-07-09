// // class ProductModel {
// //   String id;
// //   String name;
// //   String min_qty;
// //   String discount;
// //   String mrp;
// //   String price;

// //   ProductModel(
// //       {required this.id,
// //       required this.name,
// //       required this.min_qty,
// //       required this.discount,
// //       required this.mrp,
// //       required this.price});

// //   factory ProductModel.fromJson(Map<String, dynamic> json) {
// //     return ProductModel(
// //         id: json['id'],
// //         name: json['name'],
// //         min_qty: json['min_gty'],
// //         discount: json['discount'],
// //         mrp: json['mrp'],
// //         price: json['price']);
// //   }
// // }

// import 'package:task/model/categorie_model.dart';

// class Product {
//   final int id;
//   final String name;
//   final int minQty;
//   final int discount;
//   final double mrp;
//   final double price;

//   Product({
//     required this.id,
//     required this.name,
//     required this.minQty,
//     required this.discount,
//     required this.mrp,
//     required this.price,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['id'],
//       name: json['name'],
//       minQty: json['min_qty'],
//       discount: json['discount'],
//       mrp: json['mrp'].toDouble(),
//       price: json['price'].toDouble(),
//     );
//   }
// }

// class CategoryList {
//   final List<Category> categories;

//   CategoryList({required this.categories});

//   factory CategoryList.fromJson(Map<String, dynamic> json) {
//     return CategoryList(
//       categories: List<Category>.from(
//         json['category'].map((category) => Category.fromJson(category)),
//       ),
//     );
//   }
// }

class Product {
  final int id;
  final String name;
  late final int minQty;
  final int discount;
  final double mrp;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.minQty,
    required this.discount,
    required this.mrp,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      minQty: json['min_qty'],
      discount: json['discount'],
      mrp: json['mrp'].toDouble(),
      price: json['price'].toDouble(),
    );
  }
}
