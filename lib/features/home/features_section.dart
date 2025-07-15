import 'package:flutter/material.dart';
import 'dart:ui';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    final features = [
      {
        'icon': Icons.auto_awesome,
        'title': 'AI & Data Science',
        'desc':
            'Harnessing artificial intelligence and data for smarter solutions.',
      },
      {
        'icon': Icons.public,
        'title': 'Space Tech',
        'desc': 'Exploring new frontiers with space-inspired innovation.',
      },
      {
        'icon': Icons.devices,
        'title': 'Cross-Platform Apps',
        'desc': 'Building seamless experiences for web, mobile, and beyond.',
      },
      {
        'icon': Icons.security,
        'title': 'Secure Systems',
        'desc': 'Ensuring privacy, security, and trust in every project.',
      },
      {
        'icon': Icons.design_services,
        'title': 'UI/UX Excellence',
        'desc': 'Designing beautiful, intuitive, and accessible interfaces.',
      },
      {
        'icon': Icons.cloud,
        'title': 'Cloud Solutions',
        'desc': 'Scalable, reliable, and future-proof cloud architectures.',
      },
    ];
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFF7F8FA), Color(0xFFE3E6FF)],
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 56 : 112,
        horizontal: isMobile ? 8 : 64,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Innovative Solutions',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.w800,
              color: const Color(0xFF22223B),
              fontSize: isMobile ? 28 : 38,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 40),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 3,
              crossAxisSpacing: isMobile ? 18 : 36,
              mainAxisSpacing: isMobile ? 18 : 36,
              childAspectRatio: 1.15,
            ),
            itemCount: features.length,
            itemBuilder: (context, i) {
              final f = features[i];
              return _FeatureCard(
                icon: f['icon'] as IconData,
                title: f['title'] as String,
                desc: f['desc'] as String,
                delay: i * 100,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String desc;
  final int delay;
  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.desc,
    required this.delay,
    Key? key,
  }) : super(key: key);

  @override
  State<_FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<_FeatureCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );
    Future.delayed(
      Duration(milliseconds: widget.delay),
      () => _controller.forward(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: ClipRRect(
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
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(widget.icon, size: 48, color: const Color(0xFF6C63FF)),
                  const SizedBox(height: 22),
                  Text(
                    widget.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF22223B),
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.desc,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.blueGrey[700],
                      fontSize: 15.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
