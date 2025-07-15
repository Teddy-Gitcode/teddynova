import 'package:flutter/material.dart';
import '../../widgets/project_card.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({Key? key}) : super(key: key);

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final List<Map<String, String>> projects = [
    {
      'title': 'Cosmic Portfolio',
      'description':
          'A sci-fi themed portfolio built with Flutter Web, featuring animated starfields and cosmic UI.',
      'imageUrl':
          'https://images.unsplash.com/photo-1462331940025-496dfbfc7564?auto=format&fit=crop&w=600&q=80',
      'linkUrl': 'https://github.com/teddynova/cosmic-portfolio',
    },
    {
      'title': 'Stellar Blog',
      'description':
          'A blog platform inspired by galaxies, with glowing cards and smooth transitions.',
      'imageUrl':
          'https://images.unsplash.com/photo-1444703686981-a3abbc4d4fe3?auto=format&fit=crop&w=600&q=80',
      'linkUrl': 'https://github.com/teddynova/stellar-blog',
    },
    {
      'title': 'Nebula Chat',
      'description':
          'A real-time chat app with cosmic gradients and animated backgrounds.',
      'imageUrl':
          'https://images.unsplash.com/photo-1465101046530-73398c7f28ca?auto=format&fit=crop&w=600&q=80',
      'linkUrl': 'https://github.com/teddynova/nebula-chat',
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Projects', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 32),
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount =
                  isMobile ? 1 : (constraints.maxWidth ~/ 350).clamp(2, 3);
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 32,
                  mainAxisSpacing: 32,
                  childAspectRatio: 0.85,
                ),
                itemCount: projects.length,
                itemBuilder: (context, i) {
                  final animation = CurvedAnimation(
                    parent: _controller,
                    curve: Interval(
                      i * 0.15,
                      (i + 1) * 0.3,
                      curve: Curves.easeOut,
                    ),
                  );
                  final p = projects[i];
                  return ProjectCard(
                    title: p['title']!,
                    description: p['description']!,
                    imageUrl: p['imageUrl']!,
                    linkUrl: p['linkUrl']!,
                    animation: animation,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
