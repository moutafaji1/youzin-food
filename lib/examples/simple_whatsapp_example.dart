import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SimpleWhatsAppExample extends StatelessWidget {
  const SimpleWhatsAppExample({super.key});

  // 📱 الرقم (قابل للتعديل)
  static const String phoneNumber = '+212777149406';
  
  // 💬 الرسالة (قابلة للتعديل)
  static const String message = '''السلام عليكم ورحمة الله وبركاته

أريد أن أطلب من مطعم YOUZIN FOOD:

🍕 المنتجات المطلوبة:
- [اكتب المنتجات هنا]

📍 عنوان التوصيل:
[ضع عنوانك هنا]

📞 رقم الهاتف:
[ضع رقمك هنا]

شكراً لكم 🙏''';

  // 🚀 دالة إرسال واتساب
  Future<void> _sendToWhatsApp() async {
    try {
      // تنظيف الرقم
      String cleanNumber = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');
      if (!cleanNumber.startsWith('+')) {
        cleanNumber = '+$cleanNumber';
      }

      // ترميز الرسالة
      String encodedMessage = Uri.encodeComponent(message);
      
      // رابط واتساب
      String whatsappUrl = 'https://wa.me/$cleanNumber?text=$encodedMessage';
      final Uri uri = Uri.parse(whatsappUrl);

      // فتح واتساب
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        await launchUrl(uri, mode: LaunchMode.platformDefault);
      }
    } catch (e) {
      debugPrint('خطأ في فتح واتساب: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إرسال واتساب'),
        backgroundColor: const Color(0xFF25D366),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // أيقونة واتساب
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xFF25D366),
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(
                Icons.message,
                size: 50,
                color: Colors.white,
              ),
            ),
            
            const SizedBox(height: 30),
            
            // النص التوضيحي
            const Text(
              'اضغط على الزر لإرسال طلبك عبر واتساب',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            
            const SizedBox(height: 40),
            
            // 🔥 الزر الرئيسي
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton.icon(
                onPressed: _sendToWhatsApp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF25D366), // أخضر واتساب
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                  shadowColor: Colors.black.withValues(alpha: 0.3),
                ),
                icon: const Icon(
                  Icons.send,
                  size: 24,
                ),
                label: const Text(
                  'إرسال الطلب عبر واتساب',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // معلومات إضافية
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '📱 الرقم: $phoneNumber',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    '💬 سيتم فتح واتساب مع رسالة جاهزة',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 🎯 للاستخدام السريع في أي مكان
class QuickWhatsAppButton extends StatelessWidget {
  final String? customMessage;
  final String? customPhone;
  
  const QuickWhatsAppButton({
    super.key,
    this.customMessage,
    this.customPhone,
  });

  Future<void> _quickSend() async {
    String phone = customPhone ?? '+212777149406';
    String msg = customMessage ?? 'السلام عليكم، أريد أن أطلب من YOUZIN FOOD';
    
    String cleanNumber = phone.replaceAll(RegExp(r'[^\d+]'), '');
    if (!cleanNumber.startsWith('+')) cleanNumber = '+$cleanNumber';
    
    String encodedMessage = Uri.encodeComponent(msg);
    String whatsappUrl = 'https://wa.me/$cleanNumber?text=$encodedMessage';
    
    final Uri uri = Uri.parse(whatsappUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: _quickSend,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF25D366),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
      icon: const Icon(Icons.message),
      label: const Text('واتساب'),
    );
  }
}
