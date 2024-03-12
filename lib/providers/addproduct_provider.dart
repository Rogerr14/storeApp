import 'dart:io';

import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/product_services.dart';

class AddProductProvider with ChangeNotifier {
  final ProductServices _productService = ProductServices();
  List<ProductModel> _productList = [];

  List<ProductModel> get productList => _productList;

  Future<void> getProducts() async {
    try {
      final List<ProductModel> list = await _productService.getProduct();
      _productList = list;
      notifyListeners();
    } catch (error) {
      throw Exception('Failed to fetch products: $error');
    }
  }

  addProduct(String title, File? image, String price, String description) {
    
    int lastIndex = productList.last.id;
    ProductModel productModel = ProductModel(
      id: lastIndex + 1,
      title: title,
      price: double.parse(price),
      description: description,
      image:
          'https://i.pinimg.com/474x/3e/a2/7c/3ea27cb2b8d462c015092f6abe28f809.jpg',
    );
    productList.add(productModel);
    notifyListeners();
  }
}
