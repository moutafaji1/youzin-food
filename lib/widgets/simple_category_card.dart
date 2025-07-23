import 'package:flutter/material.dart';
import '../models/category.dart';

class SimpleCategoryCard extends StatelessWidget {
  final FoodCategory category;
  final VoidCallback onTap;

  const SimpleCategoryCard({
    super.key,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFF2D2D2D), // لون البطاقة الداكن
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFF3A3A3A), // حدود خفيفة
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // أيقونة بدلاً من الصورة لتجنب مشاكل التحميل
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFB800).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.restaurant_menu,
                  size: 30,
                  color: Color(0xFFFFB800),
                ),
              ),
              const SizedBox(height: 12),
              // اسم التصنيف
              Text(
                category.name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFFFFF), // نص أبيض
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              // الاسم العربي
              Text(
                category.nameArabic,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFFB3B3B3), // نص رمادي فاتح
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
