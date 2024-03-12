import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/pages/detailsProduct/details_ptoduct_page.dart';
import 'package:store_app/services/product_services.dart';

class HomePage extends StatefulWidget {
  static String name = 'homePage';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

Future<List<ProductModel>> productos = ProductServices().getProduct;


class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    
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
      body: FutureBuilder(
        future: productos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return listProduct(context, snapshot);
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black26,
                strokeWidth: 3.0,
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context,'/addProductPage' ),
        child: const Icon(Icons.add_box_sharp),
      ),
    );
  }
}

Widget listProduct(
    BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
  return ListView.builder(
    itemCount: snapshot.data!.length,
    itemBuilder: (context, index) {
      return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      DetailProductPage(id: snapshot.data![index].id)));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              snapshot.data![index].title,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 40,
              height: 40,
              child: Image.network(
                snapshot.data![index].image,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              snapshot.data![index].price.toString(),
              style: const TextStyle(fontSize: 20),
            ),
            const Divider(),
          ],
        ),
      );
    },
  );
}
