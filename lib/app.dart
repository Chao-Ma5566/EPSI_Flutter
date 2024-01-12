import 'package:epsi_shop/page/cart_page.dart';
import 'package:epsi_shop/page/home_page.dart';
import 'package:epsi_shop/page/about_us_page.dart';
import 'package:epsi_shop/page/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'page/detail_page.dart';
import 'bo/produit.dart';
final _router = GoRouter(routes: [
  GoRoute(path: '/', builder: (_, __) => HomePage(title: "E-commerce"), routes: [
    GoRoute(
      path: 'cart',
      builder: (_, __) => CartPage(title: "Cart"),
    ),
    GoRoute(
      path: 'about-us',
      builder: (_, __) => AboutUs(),
    ),
    GoRoute(path: "detail",
        builder: (_,state) => DetailPage(produit: state.extra as Produit)),
    GoRoute(path: "payment",
        builder: (_,state) => PaymentPage()),
  ]),
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan.shade100),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}