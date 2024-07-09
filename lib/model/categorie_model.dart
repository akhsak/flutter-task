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
    );
  }
}
