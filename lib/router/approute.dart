/*import 'package:go_router/go_router.dart';
import 'package:store_app/pages/addProduct/add_product._page.dart';
import 'package:store_app/pages/detailsProduct/details_ptoduct_page.dart';
import 'package:store_app/pages/pages.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: LoginPage.name,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/homePage',
      name: HomePage.name,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/addProductPage',
      name: AddProductPage.name,
      builder: (context, state) => const AddProductPage(),
    ),
    GoRoute(
      path: '/detailProductPage',
      name: DetailProductPage.name,
      builder: (context, state) =>  const DetailProductPage(),
    ),
  ],
);

*/
import 'package:flutter/material.dart';
import 'package:store_app/pages/auth/loginpage.dart';
import 'package:store_app/pages/cart/cartpage.dart';
import 'package:store_app/pages/home/homepage.dart';

class Approute {
  static String initialRoute = '/loginPage';
  static Map<String, Widget Function(BuildContext context)> routes = {
    '/loginPage' : (_) => const LoginPage(),
    '/homePage' : (_) => const HomePage(),
    '/cartPage' : (_) => const CartPage(),
    //'/detailProductPage': (_) => const DetailProductPage()
    
  };
}
