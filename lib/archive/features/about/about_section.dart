import 'package:flutter/material.dart';
import '../../widgets/glowing_avatar.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final List<_Milestone> milestones = const [
    _Milestone('Born on Earth', '1995', Icons.public),
    _Milestone('Started Coding', '2010', Icons.code),
    _Milestone('Launched TeddyNova', '2024', Icons.rocket_launch),
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
    final isMobile = MediaQuery.of(context).size.width < 700;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('About Me', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlowingAvatar(size: isMobile ? 90 : 140),
              const SizedBox(width: 40),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'A cosmic explorer, passionate about building futuristic digital experiences. I love blending code, art, and science to create things that feel out of this world.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 32),
                    _AnimatedTimeline(
                      milestones: milestones,
                      controller: _controller,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Milestone {
  final String title;
  final String year;
  final IconData icon;
  const _Milestone(this.title, this.year, this.icon);
}

class _AnimatedTimeline extends StatelessWidget {
  final List<_Milestone> milestones;
  final AnimationController controller;
  const _AnimatedTimeline({
    required this.milestones,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(milestones.length, (i) {
        final animation = CurvedAnimation(
          parent: controller,
          curve: Interval(i * 0.2, (i + 1) * 0.3, curve: Curves.easeOut),
        );
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.2),
              end: Offset.zero,
            ).animate(animation),
            child: _TimelineNode(
              milestone: milestones[i],
              isLast: i == milestones.length - 1,
            ),
          ),
        );
      }),
    );
  }
}

class _TimelineNode extends StatelessWidget {
  final _Milestone milestone;
  final bool isLast;
  const _TimelineNode({required this.milestone, required this.isLast, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const RadialGradient(
                  colors: [Color(0xFF3A8DFF), Color(0xFFB16DFF), Colors.black],
                  stops: [0.0, 0.7, 1.0],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF3A8DFF).withOpacity(0.4),
                    blurRadius: 12,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Icon(milestone.icon, color: Colors.white, size: 20),
            ),
            if (!isLast)
              Container(
                width: 4,
                height: 48,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF3A8DFF), Color(0xFFB16DFF)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(width: 18),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              milestone.year,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.blueAccent),
            ),
            Text(
              milestone.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
          ],
        ),
      ],
    );
  }
}
