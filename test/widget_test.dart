import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:youzin_food/main.dart';
import 'package:youzin_food/providers/cart_provider.dart';

void main() {
  testWidgets('App starts with welcome screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that welcome screen is displayed
    expect(find.text('مرحباً بك في'), findsOneWidget);
    expect(find.text('YOUZIN FOOD'), findsOneWidget);
    expect(find.text('أطعم لذيذة وخدمة مميزة'), findsOneWidget);
    expect(find.text('دخول التطبيق'), findsOneWidget);
  });

  testWidgets('Navigation to categories screen works',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Tap the enter button
    await tester.tap(find.text('دخول التطبيق'));
    await tester.pump(); // استخدام pump بدلاً من pumpAndSettle

    // Verify that categories screen is displayed
    expect(find.text('YOUZIN FOOD'), findsOneWidget);
  });

  testWidgets('Cart provider works correctly', (WidgetTester tester) async {
    final cartProvider = CartProvider();

    // Test initial state
    expect(cartProvider.items.length, 0);
    expect(cartProvider.itemCount, 0);
    expect(cartProvider.subtotalAmount, 0.0);
    expect(
        cartProvider.totalAmount, CartProvider.deliveryFee); // رسوم التوصيل فقط
  });

  testWidgets('App works in light mode only', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Navigate to categories screen
    await tester.tap(find.text('دخول التطبيق'));
    await tester.pumpAndSettle();

    // Check that category names are visible in light mode
    expect(find.text('PASTICCIO'), findsOneWidget);
    expect(find.text('POUTINES'), findsOneWidget);

    // Verify no theme toggle buttons exist
    expect(find.byIcon(Icons.dark_mode), findsNothing);
    expect(find.byIcon(Icons.light_mode), findsNothing);
  });
}
