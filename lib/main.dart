import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'providers/theme_provider.dart';
import 'screens/welcome_screen.dart';
import 'screens/categories_screen.dart';

import 'screens/cart_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'YouZin Food',
            debugShowCheckedModeBanner: false,
            theme: ThemeProvider.lightTheme,
            home: const WelcomeScreen(),
            routes: {
              '/categories': (context) => const CategoriesScreen(),
              '/cart': (context) => const CartScreen(),
            },
          );
        },
      ),
    );
  }
}
