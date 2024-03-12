import 'dart:math';

import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';

class FacturaPage extends StatefulWidget {
  final List<ProductModel> productList;
  const FacturaPage({super.key, required this.productList});

  @override
  State<FacturaPage> createState() => _FacturaPageState();
}

class _FacturaPageState extends State<FacturaPage> {
  @override
  Widget build(BuildContext context) {
    List<ProductModel> facturaList = widget.productList;
    final random = Random();
    int idFactura = random.nextInt(10) + 1;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black26,
        title: const Text(
          'FAKE STORE',
          style: TextStyle(color: Colors.white),
        ),
        
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border.fromBorderSide(BorderSide(color: Colors.black12))
            ),
            child: Text('Factura N:$idFactura'),
          ),
          const SizedBox(
            height: 40,
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: facturaList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.center,

                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 40,
                          ),
                          SizedBox(
                              height: 150,
                              width: 100,
                              child: Center(
                                  child: Text(facturaList[index].title))),
                          const SizedBox(
                            width: 30,
                          ),
                          Text(
                              'precio: ${facturaList[index].price.toString()}'),
                          const SizedBox(
                            width: 20,
                          ),
                          Text('cant. : ${facturaList[index].cantidad}')
                        ],
                      ),
                      const Divider()
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
