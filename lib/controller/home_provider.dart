// // import 'package:flutter/material.dart';
// // import 'package:task/service/categorie_service.dart';

// // class HomePageProvider extends ChangeNotifier {
// //   final CategorieService categorieService = CategorieService();
// //   getcategorie() async {
// //     await categorieService.getProduct();
// //     notifyListeners();
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:task/model/categorie_model.dart';
// import 'package:task/service/categorie_service.dart';

// class HomePageProvider extends ChangeNotifier {
//   final CategorieService categorieService = CategorieService();
//   List<Category> _categories = [];
//   bool _isLoading = true;
//   String _errorMessage = '';

//   List<Category> get categories => _categories;
//   bool get isLoading => _isLoading;
//   String get errorMessage => _errorMessage;

//   HomePageProvider() {
//     getCategorie();
//   }

//   getCategorie() async {
//     try {
//       _isLoading = true;
//       _errorMessage = '';
//       notifyListeners();

//       _categories = await categorieService.getProduct();
//     } catch (e) {
//       _errorMessage = e.toString();
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
// }

// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:task/model/categorie_model.dart';
// import 'package:task/model/product_model.dart';
// import 'package:task/service/categorie_service.dart';

// class HomePageProvider extends ChangeNotifier {
//   final CategorieService categorieService = CategorieService();
//   List<Category> _categories = [];
//   bool _isLoading = true;
//   String _errorMessage = '';
//   int i = 1;

//   List<Category> get categories => _categories;
//   bool get isLoading => _isLoading;
//   String get errorMessage => _errorMessage;

//   HomePageProvider() {
//     getCategorie();
//   }

//   void incrementQuantity(Product product) {
//     i++;

//     notifyListeners();
//   }

//   void decrementQuantity() {
//     if (i > 1) {
//       i--;
//     }
//     notifyListeners();
//   }

//   Future<void> getCategorie() async {
//     try {
//       _isLoading = true;
//       _errorMessage = '';
//       // notifyListeners();

//       _categories = await categorieService.getProduct();
//     } catch (e) {
//       log(e.toString());
//       _errorMessage = e.toString();
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
// }

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:task/model/categorie_model.dart';
import 'package:task/model/product_model.dart';
import 'package:task/service/categorie_service.dart';

class HomePageProvider extends ChangeNotifier {
  final CategorieService categorieService = CategorieService();
  List<Category> _categories = [];
  bool _isLoading = true;
  String _errorMessage = '';
  Map<int, int> _productQuantities = {};

  List<Category> get categories => _categories;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  Map<int, int> get productQuantities => _productQuantities;

  HomePageProvider() {
    getCategorie();
  }

  void incrementQuantity(int productId) {
    if (_productQuantities.containsKey(productId)) {
      _productQuantities[productId] = _productQuantities[productId]! + 1;
    } else {
      _productQuantities[productId] = 1;
    }
    notifyListeners();
  }

  void decrementQuantity(int productId) {
    if (_productQuantities.containsKey(productId) &&
        _productQuantities[productId]! > 1) {
      _productQuantities[productId] = _productQuantities[productId]! - 1;
    }
    notifyListeners();
  }

  Future<void> getCategorie() async {
    try {
      _isLoading = true;
      _errorMessage = '';
      // notifyListeners();

      _categories = await categorieService.getProduct();
    } catch (e) {
      log(e.toString());
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
