// ShoppingCart class manages the cart operations
import 'package:flutter/material.dart';
import 'package:task/model/product_model.dart';

class CartController extends ChangeNotifier {
  List<Product> cartItems = [];

  // Function to add an item to the cart
  void addItem(Product item) {
    // Check if the item already exists in the cart
    bool found = false;
    for (var cartItem in cartItems) {
      if (cartItem.name == item.name) {
        cartItem.minQty++;
        found = true;
        break;
      }
    }

    // If item is not found, add it to the cart
    if (!found) {
      cartItems.add(item);
    }
  }

  // Function to increase item count
  void increaseItemCount(Product item) {
    for (var cartItem in cartItems) {
      if (cartItem.name == item.name) {
        cartItem.minQty++;
        break;
      }
    }
  }

  // Function to get all added items
  List<Product> getItems() {
    return cartItems;
  }
}
