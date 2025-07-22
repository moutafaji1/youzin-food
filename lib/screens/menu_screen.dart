import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/category.dart';
import '../models/menu_item.dart';
import '../data/menu_data.dart';
import '../providers/cart_provider.dart';

class MenuScreen extends StatelessWidget {
  final FoodCategory category;

  const MenuScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final menuItems = MenuData.getItemsByCategory(category.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          // Cart button
          Consumer<CartProvider>(
            builder: (context, cart, child) {
              return Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                  ),
                  if (cart.itemCount > 0)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          '${cart.itemCount}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
      body: menuItems.isEmpty
          ? const Center(
              child: Text(
                'لا توجد عناصر في هذه الفئة',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                final item = menuItems[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.color,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item.nameArabic,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.color
                                      ?.withValues(alpha: 0.7),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '${item.price.toStringAsFixed(0)} DH',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Consumer<CartProvider>(
                          builder: (context, cart, child) {
                            final cartItem = cart.items.firstWhere(
                              (cartItem) => cartItem.menuItem.id == item.id,
                              orElse: () =>
                                  CartItem(menuItem: item, quantity: 0),
                            );
                            final quantity = cartItem.quantity;

                            if (quantity == 0) {
                              return ElevatedButton(
                                onPressed: () {
                                  cart.addItem(item);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'تم إضافة ${item.nameArabic} إلى السلة'),
                                      duration: const Duration(seconds: 1),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text('إضافة'),
                              );
                            } else {
                              return Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      cart.removeItem(item.id);
                                    },
                                    icon: const Icon(Icons.remove_circle),
                                    color: Colors.red,
                                  ),
                                  Text(
                                    '$quantity',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      cart.addItem(item);
                                    },
                                    icon: const Icon(Icons.add_circle),
                                    color: Colors.green,
                                  ),
                                ],
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
