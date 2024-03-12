import 'package:flutter/material.dart';
import 'package:store_app/providers/addproduct_provider.dart';
import 'package:store_app/providers/product_provider.dart';
import 'package:store_app/router/approute.dart';
import 'package:provider/provider.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
       providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => AddProductProvider())
       ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fake Store',
        initialRoute: Approute.initialRoute,
        routes: Approute.routes,
        
      ),
    );
  }
}