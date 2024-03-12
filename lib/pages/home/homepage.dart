import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/models/product_model.dart';

import 'package:store_app/pages/detailsProduct/details_ptoduct_page.dart';
import 'package:store_app/providers/addproduct_provider.dart';

class HomePage extends StatefulWidget {
  static String name = 'homePage';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadProducts();
  }
Future<void> loadProducts() async {
  final productProvider = Provider.of<AddProductProvider>(context, listen: false);
      await productProvider.getProducts();
    }
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<AddProductProvider>(context);
    final List<ProductModel> productList = productProvider.productList;

    



    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black26,
        title: const Text(
          'FAKE STORE',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/cartPage'),
            icon: const Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: listProduct(productList),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/addProductPage'),
        child: const Icon(Icons.add_box_sharp),
      ),
    );
  }

  Widget listProduct(List<ProductModel> productList) {
    if (productList.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.black54,
          strokeWidth: 3.0,
        ),
      );
    } else {
      return ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          DetailProductPage(id: productList[index].id)));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  productList[index].title,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: Image.network(
                    productList[index].image,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  productList[index].price.toString(),
                  style: const TextStyle(fontSize: 20),
                ),
                const Divider(),
              ],
            ),
          );
        },
      );
    }
  }
}
