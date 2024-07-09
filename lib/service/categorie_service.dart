import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:task/model/categorie_model.dart';

class CategorieService {
  final String url = "https://yip-dev.techbutomy.com/api/category-list";
  Dio dio = Dio();

  Future<List<Category>> getProduct() async {
    try {
      final Response response = await dio.get(url);
      if (response.statusCode == 200) {
        final data = response.data;
        return (data['category'] as List)
            .map((json) => Category.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      log('dsakjaka');
      throw Exception('Error: $e');
    }
  }
}
