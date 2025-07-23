import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/youzin_logo.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF4A90E2),
              Color(0xFF357ABD),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),

              // Chef Hat Icon
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.restaurant_menu,
                  size: 60,
                  color: Color(0xFF4A90E2),
                ),
              ),

              const SizedBox(height: 40),

              // Arabic Welcome Text
              const Text(
                'مرحباً بك في',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 10),

              // App Name with Animated Logo
              const YouzinLogo(
                fontSize: 36,
                animated: true,
                animationDuration: Duration(milliseconds: 1500),
              ),

              const SizedBox(height: 10),

              // Arabic Subtitle
              const Text(
                'أطعم لذيذة وخدمة مميزة',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),

              const Spacer(flex: 2),

              // Enter Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/categories');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFB800),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 8,
                      shadowColor:
                          const Color(0xFFFFB800).withValues(alpha: 0.3),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'دخول التطبيق',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.arrow_forward, size: 20),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // زر Instagram
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton.icon(
                    onPressed: () async {
                      final Uri instagramUrl =
                          Uri.parse('https://www.instagram.com/youzin_food/');
                      if (await canLaunchUrl(instagramUrl)) {
                        await launchUrl(instagramUrl,
                            mode: LaunchMode.externalApplication);
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      side:
                          const BorderSide(color: Color(0xFFFFB800), width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                    icon: const Icon(
                      Icons.camera_alt,
                      color: Color(0xFFFFB800),
                      size: 20,
                    ),
                    label: const Text(
                      'تابعنا على Instagram',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFFB800),
                      ),
                    ),
                  ),
                ),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
