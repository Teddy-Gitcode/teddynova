import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({Key? key}) : super(key: key);

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _ringController;

  @override
  void initState() {
    super.initState();
    _ringController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _ringController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      width: double.infinity,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Animated glowing ring (warp/black hole effect)
            AnimatedBuilder(
              animation: _ringController,
              builder: (context, child) {
                return CustomPaint(
                  painter: _WarpRingPainter(_ringController.value),
                  size: Size(isMobile ? 180 : 320, isMobile ? 180 : 320),
                );
              },
            ),
            // Animated "TeddyNova" text
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      'TeddyNova',
                      textStyle: Theme.of(
                        context,
                      ).textTheme.headlineLarge?.copyWith(
                        foreground:
                            Paint()
                              ..shader = const LinearGradient(
                                colors: [Color(0xFF3A8DFF), Color(0xFFB16DFF)],
                              ).createShader(Rect.fromLTWH(0, 0, 300, 80)),
                        fontSize: isMobile ? 38 : 64,
                        letterSpacing: 2,
                      ),
                      speed: const Duration(milliseconds: 90),
                    ),
                  ],
                  isRepeatingAnimation: false,
                  totalRepeatCount: 1,
                  displayFullTextOnTap: true,
                  pause: const Duration(milliseconds: 400),
                ),
                const SizedBox(height: 16),
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: 1),
                  duration: const Duration(milliseconds: 1200),
                  curve: Curves.easeOut,
                  builder:
                      (context, value, child) => Opacity(
                        opacity: value,
                        child: Transform.translate(
                          offset: Offset(0, (1 - value) * 30),
                          child: child,
                        ),
                      ),
                  child: Text(
                    'Exploring Code Across the Stars.',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white.withOpacity(0.85),
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _WarpRingPainter extends CustomPainter {
  final double progress;
  _WarpRingPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2.2;
    final glowPaint =
        Paint()
          ..shader = RadialGradient(
            colors: [
              Colors.white.withOpacity(0.08 + 0.08 * progress),
              Colors.blueAccent.withOpacity(0.18 + 0.12 * progress),
              Colors.purpleAccent.withOpacity(0.12 + 0.10 * (1 - progress)),
              Colors.transparent,
            ],
            stops: const [0.0, 0.5, 0.8, 1.0],
          ).createShader(Rect.fromCircle(center: center, radius: radius * 1.2));
    canvas.drawCircle(center, radius * (1.0 + 0.04 * progress), glowPaint);
    // Draw a subtle ring
    final ringPaint =
        Paint()
          ..color = Colors.white.withOpacity(0.18 + 0.12 * progress)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3.5 + 2 * progress;
    canvas.drawCircle(center, radius, ringPaint);
  }

  @override
  bool shouldRepaint(covariant _WarpRingPainter oldDelegate) => true;
}
