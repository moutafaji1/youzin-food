class MenuItem {
  final String id;
  final String name;
  final String nameArabic;
  final double price;
  final String category;
  final String? description;
  final String? image;

  MenuItem({
    required this.id,
    required this.name,
    required this.nameArabic,
    required this.price,
    required this.category,
    this.description,
    this.image,
  });
}

class CartItem {
  final MenuItem menuItem;
  int quantity;

  CartItem({
    required this.menuItem,
    this.quantity = 1,
  });

  double get totalPrice => menuItem.price * quantity;
}
