import 'package:flutter/material.dart';
import 'dart:ui';
import '../../widgets/modern_button.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
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
              'Contact',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.w800,
                color: const Color(0xFF22223B),
                fontSize: isMobile ? 28 : 38,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 40),
            Center(child: _GlassContactForm(isMobile: isMobile)),
            const SizedBox(height: 40),
            Wrap(
              spacing: 24,
              alignment: WrapAlignment.center,
              children: [
                _ContactLink(
                  icon: Icons.email,
                  label: 'Email',
                  url: 'mailto:hello@teddynova.com',
                ),
                _ContactLink(
                  icon: Icons.code,
                  label: 'GitHub',
                  url: 'https://github.com/teddynova',
                ),
                _ContactLink(
                  icon: Icons.business,
                  label: 'LinkedIn',
                  url: 'https://linkedin.com/in/teddynova',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _GlassContactForm extends StatelessWidget {
  final bool isMobile;
  const _GlassContactForm({required this.isMobile, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Container(
          width: isMobile ? double.infinity : 420,
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.55),
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF6C63FF).withOpacity(0.08),
                blurRadius: 16,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Your Name',
                  prefixIcon: Icon(Icons.person, color: Colors.blueGrey[400]),
                ),
              ),
              const SizedBox(height: 18),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Your Email',
                  prefixIcon: Icon(Icons.email, color: Colors.blueGrey[400]),
                ),
              ),
              const SizedBox(height: 18),
              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: 'Message',
                  prefixIcon: Icon(Icons.message, color: Colors.blueGrey[400]),
                ),
              ),
              const SizedBox(height: 24),
              ModernButton(label: 'Send', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactLink extends StatelessWidget {
  final IconData icon;
  final String label;
  final String url;
  const _ContactLink({
    required this.icon,
    required this.label,
    required this.url,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.blueGrey[700], size: 20),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: Colors.blueGrey[700],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
