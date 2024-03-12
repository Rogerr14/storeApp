import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  final List<ProductModel> _productList = [];
  final List<ProductModel> _facturaList = [];
  List<ProductModel> get productList => _productList;
  List<ProductModel> get facturaList => _facturaList;

  addProduct(ProductModel productModel) {
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

  restProduct(ProductModel productModel) {
    for (var product in productList) {
      if (productModel.id == product.id) {
        if (product.cantidad > 1) {
          product.cantidad--;
        } else if (product.cantidad == 1) {
          productList.remove(product);
          return;
        }
      }
    }

    notifyListeners();
  }

  removeProduct(ProductModel productModel) {
    for (var product in productList) {
      if (productModel.id == product.id) {
        productList.remove(product);
        return;
      }
    }

    notifyListeners();
  }

  removeAll() {
    facturaList.addAll(productList);
    productList.clear();
    notifyListeners();
  }
}
