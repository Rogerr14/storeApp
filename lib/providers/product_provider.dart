

import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _productList = [];
  List<ProductModel> get productList => _productList;

  addProduct(ProductModel productModel) {
    /*if (productList.first.id == productModel.id) {
      productList.first.cantidad++;
    } else {
      productList.add(productModel);
    }
    notifyListeners();*/

    bool existProduct = false;

    for (var product in productList) {
      if (productModel.id == product.id) {
        product.cantidad++;
        existProduct = true;
      }
    }

    if (existProduct == false) {
      productList.add(productModel);
    }
    notifyListeners();
  }
}
