import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'screens/welcome_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/cart_screen.dart';
import 'theme/dark_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'YouZin Food',
        debugShowCheckedModeBanner: false,
        theme: DarkTheme.darkTheme,
        darkTheme: DarkTheme.darkTheme,
        themeMode: ThemeMode.dark,
        home: const WelcomeScreen(),
        routes: {
          '/categories': (context) => const CategoriesScreen(),
          '/cart': (context) => const CartScreen(),
        },
      ),
    );
  }
}
