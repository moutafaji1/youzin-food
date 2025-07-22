import 'package:flutter/foundation.dart';
import '../models/menu_item.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];
  static const double deliveryFee = 10.0; // رسوم التوصيل 10 درهم
  bool _isProcessing = false; // حماية من العمليات المتعددة

  List<CartItem> get items => _items;
  bool get isProcessing => _isProcessing;

  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);

  double get subtotalAmount =>
      _items.fold(0.0, (sum, item) => sum + item.totalPrice);

  double get totalAmount => subtotalAmount + deliveryFee;

  void addItem(MenuItem menuItem) {
    if (_isProcessing) return; // منع العمليات المتعددة

    _isProcessing = true;
    try {
      final existingIndex = _items.indexWhere(
        (item) => item.menuItem.id == menuItem.id,
      );

      if (existingIndex >= 0) {
        _items[existingIndex].quantity++;
      } else {
        _items.add(CartItem(menuItem: menuItem));
      }
      notifyListeners();
    } finally {
      _isProcessing = false;
    }
  }

  void removeItem(String menuItemId) {
    if (_isProcessing) return; // منع العمليات المتعددة

    _isProcessing = true;
    try {
      final existingIndex = _items.indexWhere(
        (item) => item.menuItem.id == menuItemId,
      );

      if (existingIndex >= 0) {
        if (_items[existingIndex].quantity > 1) {
          _items[existingIndex].quantity--;
        } else {
          _items.removeAt(existingIndex);
        }
        notifyListeners();
      }
    } finally {
      _isProcessing = false;
    }
  }

  void deleteItem(String menuItemId) {
    _items.removeWhere((item) => item.menuItem.id == menuItemId);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  String generateWhatsAppMessage() {
    if (_items.isEmpty) return '';

    String message = '🍽️ *طلب جديد من YouZin FOOD*\n\n';
    message += '📋 *تفاصيل الطلب:*\n';

    for (int i = 0; i < _items.length; i++) {
      var item = _items[i];
      message += '${i + 1}. ${item.menuItem.name}\n';
      message += 'الكمية: ${item.quantity}\n';
      message += 'السعر: ${item.totalPrice.toStringAsFixed(0)} درهم\n\n';
    }

    message += '💰 *ملخص الفاتورة:*\n';
    message += 'المجموع الفرعي: ${subtotalAmount.toStringAsFixed(0)} درهم\n';
    message += 'رسوم التوصيل: ${deliveryFee.toStringAsFixed(0)} درهم\n';
    message += 'المجموع الكلي: ${totalAmount.toStringAsFixed(0)} درهم\n\n';
    message += '📞 يرجى تأكيد الطلب وإرسال العنوان للتوصيل\n';
    message += '📍 send localisation';

    return message;
  }
}
