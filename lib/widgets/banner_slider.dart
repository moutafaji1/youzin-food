import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  int _currentIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  // قائمة صور البانر
  final List<String> _bannerImages = [
    'assets/images/banners/banner1.png',
    'assets/images/banners/banner2.png',
    'assets/images/banners/banner3.png',
    'assets/images/banners/banner4.png',
    'assets/images/banners/banner5.png',
    'assets/images/banners/banner6.png',
    'assets/images/banners/banner7.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          // السلايدر الرئيسي
          CarouselSlider(
            carouselController: _controller,
            options: CarouselOptions(
              height: 180,
              aspectRatio: 16 / 9,
              viewportFraction: 1.0,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: false,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: _bannerImages.map((imagePath) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                        cacheWidth: 800, // تحسين الذاكرة للبانر
                        cacheHeight: 400, // تحسين الذاكرة للبانر
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFF4A90E2),
                                  Color(0xFF357ABD),
                                ],
                              ),
                            ),
                            child: const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.restaurant_menu,
                                    size: 48,
                                    color: Colors.white,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'YouZin Food',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'أشهى الأطباق',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),

          const SizedBox(height: 12),

          // مؤشرات النقاط
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _bannerImages.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: _currentIndex == entry.key ? 24 : 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: _currentIndex == entry.key
                        ? const Color(0xFF4A90E2)
                        : Colors.grey.withValues(alpha: 0.4),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
