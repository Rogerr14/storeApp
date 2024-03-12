import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/providers/product_provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartProvider =
        Provider.of<ProductProvider>(context, listen: false).productList;
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black26,
        title: const Text(
          'FAKE STORE',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: cartProvider.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                children: [
                  Image.network(cartProvider[index].image, height: 80, width: 80,),
                  Text(cartProvider[index].title),
                  Text(cartProvider[index].price.toString())
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
