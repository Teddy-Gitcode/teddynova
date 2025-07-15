import 'package:flutter/material.dart';
import '../../widgets/modern_button.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background image
          SizedBox(
            width: double.infinity,
            height: isMobile ? 320 : 420,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Image.asset(
                'assets/images/hero_bg.jpg',
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          // Floating card overlay
          Positioned(
            top: isMobile ? 60 : 90,
            left: isMobile ? 16 : 80,
            right: isMobile ? 16 : 80,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 32 : 48,
                horizontal: isMobile ? 18 : 48,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.92),
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.07),
                    blurRadius: 32,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Teddynova',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: isMobile ? 32 : 54,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'F potentiates',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey[700],
                      fontSize: isMobile ? 16 : 20,
                    ),
                  ),
                  const SizedBox(height: 28),
                  ModernButton(label: 'Call you here', onPressed: () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
