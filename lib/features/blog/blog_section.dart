import 'package:flutter/material.dart';
import 'dart:ui';
import '../../widgets/modern_card.dart';
import '../../widgets/modern_button.dart';
import '../../data/blog_data.dart';

class BlogSection extends StatelessWidget {
  const BlogSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFFF7F8FA), Color(0xFFE3E6FF)],
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 56 : 112,
        horizontal: isMobile ? 8 : 64,
      ),
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        duration: const Duration(milliseconds: 900),
        curve: Curves.easeOutCubic,
        builder:
            (context, value, child) => Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0, (1 - value) * 40),
                child: child,
              ),
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Blog',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.w800,
                color: const Color(0xFF22223B),
                fontSize: isMobile ? 28 : 38,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 40),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: blogData.length,
              separatorBuilder: (context, i) => const SizedBox(height: 28),
              itemBuilder: (context, i) {
                final article = blogData[i];
                return _GlassBlogCard(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          article['title'] ?? '',
                          style: Theme.of(
                            context,
                          ).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF6C63FF),
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          article['excerpt'] ?? '',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge?.copyWith(
                            color: Colors.blueGrey[700],
                            fontSize: 15.5,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              article['date'] ?? '',
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: Colors.blueGrey[400]),
                            ),
                            ModernButton(label: 'Read', onPressed: () {}),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _GlassBlogCard extends StatelessWidget {
  final Widget child;
  const _GlassBlogCard({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.white.withOpacity(0.65),
          shadowColor: const Color(0xFF6C63FF).withOpacity(0.10),
          child: child,
        ),
      ),
    );
  }
}
