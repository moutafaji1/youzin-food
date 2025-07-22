import 'package:flutter/material.dart';

class YouzinLogo extends StatefulWidget {
  final double fontSize;
  final bool animated;
  final Duration animationDuration;

  const YouzinLogo({
    super.key,
    this.fontSize = 32.0,
    this.animated = false,
    this.animationDuration = const Duration(seconds: 2),
  });

  @override
  State<YouzinLogo> createState() => _YouzinLogoState();
}

class _YouzinLogoState extends State<YouzinLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    ));

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    if (widget.animated) {
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget logoWidget = Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFFFD700), // Gold
            Color(0xFFFFA500), // Orange
            Color(0xFFFF8C00), // Dark Orange
          ],
          stops: [0.0, 0.5, 1.0],
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            offset: const Offset(2, 2),
            blurRadius: 6,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: const Color(0xFFFFD700).withValues(alpha: 0.2),
            offset: const Offset(-1, -1),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Text(
        'YOUZIN FOOD',
        style: TextStyle(
          fontSize: widget.fontSize,
          fontWeight: FontWeight.w900,
          color: Colors.white,
          letterSpacing: 2.0,
          height: 1.2,
          shadows: [
            Shadow(
              offset: const Offset(1, 1),
              blurRadius: 3,
              color: Colors.black.withValues(alpha: 0.5),
            ),
            Shadow(
              offset: const Offset(-0.5, -0.5),
              blurRadius: 2,
              color: const Color(0xFFFFFF99).withValues(alpha: 0.3),
            ),
          ],
        ),
      ),
    );

    // إضافة تأثير إضافي للمظهر المعدني
    logoWidget = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withValues(alpha: 0.1),
            Colors.transparent,
            Colors.black.withValues(alpha: 0.1),
          ],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
      child: logoWidget,
    );

    if (widget.animated) {
      return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Opacity(
              opacity: _opacityAnimation.value,
              child: logoWidget,
            ),
          );
        },
      );
    }

    return logoWidget;
  }
}

// Widget مبسط للاستخدام السريع
class SimpleYouzinLogo extends StatelessWidget {
  final double fontSize;

  const SimpleYouzinLogo({
    super.key,
    this.fontSize = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFFFD700), // Gold
            Color(0xFFFF8C00), // Orange
          ],
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            offset: const Offset(1, 1),
            blurRadius: 3,
          ),
        ],
      ),
      child: Text(
        'YOUZIN FOOD',
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w900,
          color: Colors.white,
          letterSpacing: 1.5,
          shadows: [
            Shadow(
              offset: const Offset(1, 1),
              blurRadius: 2,
              color: Colors.black.withValues(alpha: 0.5),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget للهيدر مع حجم متجاوب
class ResponsiveYouzinLogo extends StatelessWidget {
  const ResponsiveYouzinLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final fontSize = screenWidth < 360
        ? 20.0
        : screenWidth < 400
            ? 24.0
            : 28.0;

    return SimpleYouzinLogo(fontSize: fontSize);
  }
}
