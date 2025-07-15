import 'package:flutter/material.dart';
import 'dart:ui';
import '../../widgets/modern_card.dart';
import '../../widgets/modern_button.dart';
import '../../data/projects_data.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
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
              'Projects',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.w800,
                color: const Color(0xFF22223B),
                fontSize: isMobile ? 28 : 38,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 40),
            LayoutBuilder(
              builder: (context, constraints) {
                final crossAxisCount =
                    isMobile ? 1 : (constraints.maxWidth ~/ 340).clamp(2, 3);
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: isMobile ? 18 : 36,
                    mainAxisSpacing: isMobile ? 18 : 36,
                    childAspectRatio: 0.95,
                  ),
                  itemCount: projectsData.length,
                  itemBuilder: (context, i) {
                    final p = projectsData[i];
                    return _GlassProjectCard(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                p['imageUrl'] ?? '',
                                height: 120,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder:
                                    (context, error, stackTrace) => Container(
                                      height: 120,
                                      color: Colors.grey[200],
                                      child: const Center(
                                        child: Icon(
                                          Icons.broken_image,
                                          color: Colors.grey,
                                          size: 40,
                                        ),
                                      ),
                                    ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              p['title'] ?? '',
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
                              p['description'] ?? '',
                              style: Theme.of(
                                context,
                              ).textTheme.bodyLarge?.copyWith(
                                color: Colors.blueGrey[700],
                                fontSize: 15.5,
                              ),
                            ),
                            const Spacer(),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: ModernButton(
                                label: 'View',
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _GlassProjectCard extends StatelessWidget {
  final Widget child;
  const _GlassProjectCard({required this.child, Key? key}) : super(key: key);

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
