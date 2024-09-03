import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/models/cart_model.dart';
import 'package:shopapp/pages/cart_page.dart';
import 'package:shopapp/pages/home_page.dart';
import 'package:shopapp/pages/intro_page.dart';
import 'package:shopapp/pages/shop_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CartModel(),
        builder: (context, child) => MaterialApp(
              title: 'Shop App',
              debugShowCheckedModeBanner: false,
              home: const IntroPage(),
              routes: {
                '/home': (context) => HomePage(),
                '/shop': (context) => ShopPage(),
                '/cart': (context) => CartPage(),
              },
            ));
  }
}
