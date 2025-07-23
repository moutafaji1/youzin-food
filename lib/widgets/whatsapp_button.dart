import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsAppButton extends StatelessWidget {
  final String phoneNumber;
  final String message;
  final String buttonText;
  final Color? buttonColor;
  final Color? textColor;
  final IconData? icon;

  const WhatsAppButton({
    super.key,
    this.phoneNumber = '+212777149406', // الرقم الافتراضي
    this.message =
        'السلام عليكم، أريد أن أطلب من مطعم YOUZIN FOOD', // الرسالة الافتراضية
    this.buttonText = 'إرسال عبر واتساب',
    this.buttonColor,
    this.textColor,
    this.icon = Icons.message,
  });

  Future<void> _sendWhatsAppMessage() async {
    // تنظيف الرقم من أي رموز غير مرغوب فيها
    String cleanNumber = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');

    // التأكد من أن الرقم يبدأ بـ +
    if (!cleanNumber.startsWith('+')) {
      cleanNumber = '+$cleanNumber';
    }

    // ترميز الرسالة للـ URL
    String encodedMessage = Uri.encodeComponent(message);

    // إنشاء رابط واتساب
    String whatsappUrl = 'https://wa.me/$cleanNumber?text=$encodedMessage';

    try {
      final Uri uri = Uri.parse(whatsappUrl);

      // التحقق من إمكانية فتح الرابط
      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication, // فتح في تطبيق واتساب مباشرة
        );
      } else {
        // في حالة فشل فتح واتساب، جرب فتح في المتصفح
        await launchUrl(
          uri,
          mode: LaunchMode.platformDefault,
        );
      }
    } catch (e) {
      // معالجة الأخطاء
      debugPrint('خطأ في فتح واتساب: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton.icon(
        onPressed: _sendWhatsAppMessage,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              buttonColor ?? const Color(0xFF25D366), // لون واتساب الأخضر
          foregroundColor: textColor ?? Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          elevation: 3,
          shadowColor: Colors.black.withValues(alpha: 0.3),
        ),
        icon: Icon(
          icon,
          size: 20,
        ),
        label: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

// مثال على الاستخدام في أي شاشة
class WhatsAppExample extends StatelessWidget {
  const WhatsAppExample({super.key});

  @override
  Widget build(BuildContext context) {
    // يمكنك تغيير الرسالة هنا
    String customMessage = '''السلام عليكم ورحمة الله وبركاته

أريد أن أطلب من مطعم YOUZIN FOOD:

🍕 بيتزا مارغريتا - 20 درهم
🌮 تاكوس دجاج - 25 درهم
🍟 بطاطا مقلية - 7 درهم

📍 العنوان: [ضع عنوانك هنا]
📞 الهاتف: [ضع رقمك هنا]

شكراً لكم''';

    return Scaffold(
      appBar: AppBar(
        title: const Text('مثال واتساب'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // زر واتساب بالإعدادات الافتراضية
            const WhatsAppButton(),

            const SizedBox(height: 20),

            // زر واتساب مخصص
            WhatsAppButton(
              phoneNumber: '+212777149406',
              message: customMessage,
              buttonText: 'أرسل طلبي الآن',
              buttonColor: const Color(0xFFFFB800), // لون ذهبي
              textColor: Colors.black,
              icon: Icons.restaurant,
            ),

            const SizedBox(height: 20),

            // زر واتساب آخر مع رسالة مختلفة
            const WhatsAppButton(
              phoneNumber: '+212777149406',
              message: 'مرحباً، أريد الاستفسار عن قائمة الطعام في YOUZIN FOOD',
              buttonText: 'استفسار عن القائمة',
              buttonColor: Colors.blue,
              icon: Icons.help_outline,
            ),
          ],
        ),
      ),
    );
  }
}
