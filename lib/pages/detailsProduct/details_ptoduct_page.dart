import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:store_app/models/product_model.dart';
import 'package:store_app/providers/product_provider.dart';
import 'package:store_app/services/product_services.dart';

class DetailProductPage extends StatefulWidget {
  static String name = 'detailProductPage';
  final int id;
  const DetailProductPage({super.key, required this.id});

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<ProductProvider>(context, listen: false);
    //  final Object? id = GoRouterState.of(context).extra;
    print(cartProvider.productList);
    Future<ProductModel> detailProduct =
        ProductServices().getProductDetail(widget.id);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black26,
          title: const Text(
            'FAKE STORE',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: FutureBuilder(
          future: detailProduct,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return _detalleView(context, snapshot, cartProvider);
                },
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Producto no disponible.'),
              );
            }
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black45,
                strokeWidth: 3.0,
              ),
            );
          },
        ));
  }
}

Widget _detalleView(BuildContext context, AsyncSnapshot<ProductModel> snapshot,
    ProductProvider cartProvider) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const SizedBox(
        height: 20,
      ),
      SizedBox(
        width: 350,
        child: Text(
          snapshot.data!.title,
          style: const TextStyle(fontSize: 20),
        ),
      ),
      const SizedBox(
        height: 30,
      ),
      SizedBox(
        width: 350,
        height: 200,
        child: Image.network(snapshot.data!.image),
      ),
      const SizedBox(
        height: 20,
      ),
      SizedBox(
        width: 350,
        child: Text(
          snapshot.data!.price.toString(),
          style: const TextStyle(
              fontSize: 20, backgroundColor: Colors.greenAccent),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      SizedBox(
        width: 350,
        child: Text(
          snapshot.data!.description,
          style: const TextStyle(fontSize: 20),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      OutlinedButton.icon(
        onPressed: () {
          cartProvider.addProduct(snapshot.data!);
        },
        icon: const Icon(Icons.shopping_cart_outlined),
        label: const Text('Añadir al carrito'),
      ),
      const SizedBox(
        height: 40,
      ),
    ],
  );
}
