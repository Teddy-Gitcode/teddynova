import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class CosmicBackground extends StatefulWidget {
  final Widget? child;
  const CosmicBackground({Key? key, this.child}) : super(key: key);

  @override
  State<CosmicBackground> createState() => _CosmicBackgroundState();
}

class _CosmicBackgroundState extends State<CosmicBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<_Star> _stars;
  static const int starCount = 120;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
    _stars = List.generate(starCount, (index) => _Star.random());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _CosmicPainter(_stars, _controller.value),
          child: Container(
            color: Colors.black, // Solid black background
            child: widget.child,
          ),
        );
      },
    );
  }
}

class _Star {
  double x, y, radius, speed, twinkle, angle, drift;
  Color color;
  static final Random _rand = Random();

  _Star(
    this.x,
    this.y,
    this.radius,
    this.speed,
    this.twinkle,
    this.color,
    this.angle,
    this.drift,
  );

  factory _Star.random() {
    final x = _rand.nextDouble();
    final y = _rand.nextDouble();
    final radius = _rand.nextDouble() * 1.2 + 0.3;
    final speed = _rand.nextDouble() * 0.5 + 0.08; // Faster movement
    final twinkle = _rand.nextDouble();
    final angle = _rand.nextDouble() * 2 * pi; // Random direction
    final drift = _rand.nextDouble() * 0.15 + 0.02; // Horizontal drift
    final color =
        [
          Colors.white,
          Colors.white,
          Colors.white,
          Colors.blueAccent.withOpacity(0.7),
          Colors.purpleAccent.withOpacity(0.5),
          Colors.cyanAccent.withOpacity(0.4),
        ][_rand.nextInt(6)];
    return _Star(x, y, radius, speed, twinkle, color, angle, drift);
  }
}

class _CosmicPainter extends CustomPainter {
  final List<_Star> stars;
  final double animationValue;

  _CosmicPainter(this.stars, this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    for (final star in stars) {
      // Animate star movement (vertical + slight horizontal drift)
      double dx =
          (star.x + animationValue * star.drift * cos(star.angle)) % 1.0;
      double dy =
          (star.y + animationValue * star.speed * sin(star.angle)) % 1.0;
      // Twinkle effect
      double twinkle =
          0.7 + 0.3 * sin(animationValue * 2 * pi + star.twinkle * 2 * pi);
      // Draw glow (blurred circle)
      final glowPaint =
          Paint()
            ..color = star.color.withOpacity(0.25 * twinkle)
            ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);
      canvas.drawCircle(
        Offset(dx * size.width, dy * size.height),
        star.radius * 4.5,
        glowPaint,
      );
      // Draw star
      final starPaint = Paint()..color = star.color.withOpacity(twinkle);
      canvas.drawCircle(
        Offset(dx * size.width, dy * size.height),
        star.radius,
        starPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _CosmicPainter oldDelegate) => true;
}
