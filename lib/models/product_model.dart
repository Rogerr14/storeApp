// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

//Productos Listado
List<ProductModel> productsModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));
String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

//Producto unico
ProductModel productDetailModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));
String productsDetailModelToJson(ProductModel data) =>
    json.encode(data.toJson());

class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  String category;
  final String image;
   String rating;
  int cantidad;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
   this.category = '',
    required this.image,
     this.rating = '',
    this.cantidad = 1,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category: categoryValues.map[json["category"]]!.toString() ,
        image: json["image"],
        rating: Rating.fromJson(json["rating"]).toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": '', //categoryValues.reverse[category],
        "image": image,
        "rating": '',
      };
}

enum Category {
  electronics,
  jewerly,
  men_s_clothing,
  women_s_clothing,
}

final categoryValues = EnumValues({
  "electronics": Category.electronics,
  "jewelery": Category.jewerly,
  "men's clothing": Category.men_s_clothing,
  "women's clothing": Category.women_s_clothing
});

class Rating {
  final double rate;
  final int count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
