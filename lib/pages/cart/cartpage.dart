import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/pages/Factura/facturapage.dart';
import 'package:store_app/providers/product_provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<ProductProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black26,
        title: const Text(
          'FAKE STORE',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(onPressed: (){
              Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      FacturaPage(productList: cartProvider.facturaList)));
          }, icon: const Icon(Icons.list_alt_rounded))
        ],
      ),
      body: ListView.builder(
        itemCount: cartProvider.productList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Image.network(
                    cartProvider.productList[index].image,
                    height: 80,
                    width: 80,
                  ),
                  SizedBox(
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cartProvider.productList[index].title),
                        Text(cartProvider.productList[index].price.toString()),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (cartProvider.productList[index].cantidad < 1) {
                        return;
                      }
                      cartProvider.restProduct(cartProvider.productList[index]);
                      setState(() {});
                    },
                    icon: const Icon(Icons.remove),
                  ),
                  Text(
                    cartProvider.productList[index].cantidad.toString(),
                  ),
                  IconButton(
                    onPressed: () {
                      cartProvider.addProduct(cartProvider.productList[index]);
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.add,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      cartProvider
                          .removeProduct(cartProvider.productList[index]);
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.delete,
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
      floatingActionButton: OutlinedButton(
        onPressed: () {
          cartProvider.removeAll();
          
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      FacturaPage(productList: cartProvider.facturaList)));
          setState(() {});
        },
        child: const Text('Generar Factura'),
      ),
    );
  }
}
