# 🍽️ YouZin Food - Restaurant Mobile App

<div align="center">

  [![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
  [![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
  [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)
</div>

A modern, elegant Flutter application for restaurant food ordering with seamless WhatsApp integration. Built with performance optimization and beautiful UI/UX design.

## ✨ Features

### 🎨 **User Interface**
- **🌟 Animated Welcome Screen** - Beautiful entrance with restaurant branding
- **📱 Responsive Design** - Optimized for all screen sizes
- **🎯 Clean Modern UI** - Intuitive and user-friendly interface
- **🖼️ High-Quality Images** - Optimized image loading with caching

### 🍕 **Food Ordering**
- **📋 Interactive Categories** - Grid view with food category images
- **🥘 Detailed Menu Items** - Complete menu with prices and descriptions
- **🛒 Smart Shopping Cart** - Add/remove items with quantity management
- **💰 Price Calculation** - Subtotal, delivery fee, and total calculation

### 📱 **WhatsApp Integration**
- **💬 Professional Messages** - Formatted order messages with emojis
- **📋 Detailed Order Summary** - Complete breakdown of items and prices
- **📍 Location Request** - Automatic request for delivery address
- **🔗 Direct Integration** - One-tap order sending

### ⚡ **Performance**
- **🚀 Optimized Images** - Smart caching and compression
- **🔄 Smooth Scrolling** - Enhanced GridView performance
- **💾 Memory Management** - Efficient resource usage
- **🧪 Tested Code** - Comprehensive test coverage

## 🍽️ Menu Categories

| Category | Arabic Name | Description |
|----------|-------------|-------------|
| **PASTICCIO** | باستيتشو | Pasta dishes with various toppings |
| **POUTINES** | بوتين | French fries with toppings |
| **SHAWARMAS** | شاورما | Traditional Middle Eastern wraps |
| **TEX MEX** | تكس مكس | Mexican-style appetizers and sides |
| **TACOS GRATINÉS** | تاكوس گراتيني | Baked tacos with cheese |
| **TACOS** | تاكوس | Regular tacos |
| **BURGERS** | برغر | Various burger options |
| **PIZZAS** | بيتزا | Pizza varieties |
| **QUESADILLAS** | كاساديا | Mexican quesadillas |
| **ASSIETTES** | أطباق | Plate dishes |
| **SANDWICHES** | سندويشات | Sandwich options |
| **PANINIS** | بانيني | Grilled sandwiches |

## 🚀 Getting Started

### 📋 Prerequisites

- **Flutter SDK** `>=3.0.0`
- **Dart SDK** `>=3.0.0`
- **Android Studio** or **VS Code**
- **Android device** or **emulator**

### 🛠️ Installation

1. **Clone the repository:**
```bash
git clone https://github.com/yourusername/youzin-food.git
cd youzin-food
```

2. **Install dependencies:**
```bash
flutter pub get
```

3. **Run the application:**
```bash
flutter run
```

4. **Run tests:**
```bash
flutter test
```

## 📦 Dependencies

### **Core Dependencies**
- `flutter`: Flutter SDK framework
- `provider`: State management solution
- `url_launcher`: WhatsApp integration
- `carousel_slider`: Banner image slider

### **Development Dependencies**
- `flutter_test`: Testing framework
- `flutter_lints`: Code quality analysis

## 🏗️ Project Architecture

```
lib/
├── main.dart                    # 🚀 App entry point
├── models/                      # 📊 Data models
│   ├── menu_item.dart          # 🍕 Menu item and cart models
│   └── category.dart           # 📂 Food category model
├── data/                       # 💾 Static data
│   └── menu_data.dart          # 📋 Menu items and categories
├── providers/                  # 🔄 State management
│   ├── cart_provider.dart      # 🛒 Shopping cart logic
│   └── theme_provider.dart     # 🎨 Theme management
├── screens/                    # 📱 UI screens
│   ├── welcome_screen.dart     # 🌟 Welcome/splash screen
│   ├── categories_screen.dart  # 📋 Categories grid view
│   ├── menu_screen.dart        # 🍽️ Menu items display
│   └── cart_screen.dart        # 🛒 Shopping cart
└── widgets/                    # 🧩 Reusable components
    ├── banner_slider.dart      # 🎠 Image carousel
    └── category_card.dart      # 🃏 Category display card
```

## 🎯 Key Features Implementation

### **🛒 Smart Cart System**
```dart
class CartProvider with ChangeNotifier {
  static const double deliveryFee = 10.0;

  double get subtotalAmount => /* calculation */;
  double get totalAmount => subtotalAmount + deliveryFee;

  String generateWhatsAppMessage() {
    // Professional WhatsApp message formatting
  }
}
```

### **📱 WhatsApp Message Format**
```
🍽️ *طلب جديد من YouZin FOOD*

📋 *تفاصيل الطلب:*
1. Pizza 4 Fromages
الكمية: 4
السعر: 380 درهم

💰 *ملخص الفاتورة:*
المجموع الفرعي: 380 درهم
رسوم التوصيل: 10 درهم
المجموع الكلي: 390 درهم

📞 يرجى تأكيد الطلب وإرسال العنوان للتوصيل
📍 send localisation
```

### **⚡ Performance Optimizations**
```dart
Image.asset(
  imagePath,
  cacheWidth: 120,  // Memory optimization
  cacheHeight: 120, // Faster loading
  fit: BoxFit.cover,
)
```

## 🧪 Testing

The project includes comprehensive tests:

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage
```

**Test Coverage:**
- ✅ Widget tests for all screens
- ✅ Unit tests for providers
- ✅ Integration tests for user flows

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. **Fork** the project
2. **Create** your feature branch (`git checkout -b feature/AmazingFeature`)
3. **Commit** your changes (`git commit -m 'Add some AmazingFeature'`)
4. **Push** to the branch (`git push origin feature/AmazingFeature`)
5. **Open** a Pull Request

### **📝 Contribution Guidelines**
- Follow Flutter/Dart style guidelines
- Add tests for new features
- Update documentation as needed
- Ensure all tests pass

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Your Name**
- 📧 Email: your.email@example.com
- 🐙 GitHub: [@yourusername](https://github.com/yourusername)

## 🔗 Links

- **📱 Project Repository**: [GitHub](https://github.com/yourusername/youzin-food)
- **🐛 Report Issues**: [Issues](https://github.com/yourusername/youzin-food/issues)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Material Design for UI inspiration
- Contributors and testers

---

<div align="center">
  <p>Made with ❤️ using Flutter</p>
  <p>⭐ Star this repo if you found it helpful!</p>
</div>
- WhatsApp integration requires the WhatsApp app to be installed on the device
- The app supports both Arabic and French text
