import 'package:http/http.dart' as http;
import 'package:store_app/api/api.dart';
import 'package:store_app/models/product_model.dart';

class ProductServices {
  

  //obtener todos los productos
  Future<List<ProductModel>> getProduct() async {
    final response = await http.get(Uri.parse(apiProdBase));

    if (response.statusCode == 200) {
      return  productsModelFromJson(response.body);
      
      //return product;
    } else {
      throw Exception('Error al cargar datos');
    }
  }

  //obtener detalles de un solo producto
  Future<ProductModel> getProductDetail(Object? id) async {
    final response = await http.get(Uri.parse('$apiProdBase/$id'));

    if (response.statusCode == 200) {
      return productDetailModelFromJson(response.body);
    } else {
      throw Exception('Error al cargar datos');
    }
  }

  //subir nuevos productos
/*
  Future<ProductModel> putNewProduct(, String title) async {
    final response = await http.post(Uri.parse(apiProdBase),
        body: ProductModel(
            id: id,
            title: title,
            price: price,
            description: description,
            category: category,
            image: image,
            rating: rating));
  }*/
}
