import 'package:flutter/material.dart';
import 'dart:ui';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;
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
        horizontal: isMobile ? 16 : 64,
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
              'About Me',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.w800,
                color: const Color(0xFF22223B),
                fontSize: isMobile ? 28 : 38,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 36),
            Text(
              "Hi, I'm TeddyNova. I'm passionate about building beautiful, high-impact digital products. I love working with Flutter, web, and modern tech to create experiences that delight users.",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.blueGrey[800],
                fontSize: isMobile ? 16 : 18,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 44),
            Wrap(
              spacing: 32,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: const [
                _AboutHighlight(title: '5+ Years', subtitle: 'Experience'),
                _AboutHighlight(title: 'Flutter', subtitle: 'Expert'),
                _AboutHighlight(title: 'Open Source', subtitle: 'Contributor'),
                _AboutHighlight(title: 'UI/UX', subtitle: 'Enthusiast'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AboutHighlight extends StatelessWidget {
  final String title;
  final String subtitle;
  const _AboutHighlight({required this.title, required this.subtitle, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 28),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.55),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF6C63FF).withOpacity(0.08),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF6C63FF),
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.blueGrey[700],
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
