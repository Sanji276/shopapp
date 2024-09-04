import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/models/cart_model.dart';
import 'package:shopapp/pages/cart_page.dart';
import 'package:shopapp/pages/home_page.dart';
import 'package:shopapp/pages/intro_page.dart';
import 'package:shopapp/pages/shop_page.dart';
import 'package:shopapp/theme/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Shop App',
          color: Theme.of(context).colorScheme.surface,
          debugShowCheckedModeBanner: false,
          home: const IntroPage(),
          theme: themeProvider.themeData,
          routes: {
            '/home': (context) => HomePage(),
            '/shop': (context) => ShopPage(),
            '/cart': (context) => CartPage(),
          },
        );
      },
    );
  }
}
