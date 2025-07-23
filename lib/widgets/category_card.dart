import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoryCard extends StatefulWidget {
  final FoodCategory category;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.category,
    required this.onTap,
  });

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  bool _isProcessing = false;

  void _handleTap() {
    if (_isProcessing) return;

    _isProcessing = true;
    widget.onTap();

    // إعادة تعيين الحالة بعد فترة قصيرة
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        _isProcessing = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
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
            BoxShadow(
              color: const Color(0xFFFFB800).withValues(alpha: 0.1),
              spreadRadius: 0,
              blurRadius: 12,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // صورة التصنيف
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: FutureBuilder<void>(
                  future: precacheImage(
                      AssetImage(widget.category.imagePath), context),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[200],
                        ),
                        child: const Center(
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.orange),
                            ),
                          ),
                        ),
                      );
                    }
                    return Image.asset(
                      widget.category.imagePath,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      cacheWidth: 80, // تقليل أكثر للذاكرة
                      cacheHeight: 80, // تقليل أكثر للذاكرة
                      filterQuality: FilterQuality.low, // تسريع الرسم
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFF4A90E2),
                                Color(0xFF357ABD),
                              ],
                            ),
                          ),
                          child: const Icon(
                            Icons.restaurant_menu,
                            color: Colors.white,
                            size: 30,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 12),
            // اسم التصنيف
            Text(
              widget.category.name,
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
              widget.category.nameArabic,
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
    );
  }
}
