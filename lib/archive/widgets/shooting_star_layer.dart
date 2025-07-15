import 'dart:math';
import 'package:flutter/material.dart';

class ShootingStarLayer extends StatefulWidget {
  final int starCount;
  final double height;
  const ShootingStarLayer({Key? key, this.starCount = 3, this.height = 300})
    : super(key: key);

  @override
  State<ShootingStarLayer> createState() => _ShootingStarLayerState();
}

class _ShootingStarLayerState extends State<ShootingStarLayer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<_ShootingStar> _stars;
  final Random _rand = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat();
    _stars = List.generate(
      widget.starCount,
      (i) => _ShootingStar.random(widget.height, _rand),
    );
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
          painter: _ShootingStarPainter(_stars, _controller.value),
          size: Size(double.infinity, widget.height),
        );
      },
    );
  }
}

class _ShootingStar {
  double startX, startY, length, angle, speed, delay;
  Color color;
  _ShootingStar(
    this.startX,
    this.startY,
    this.length,
    this.angle,
    this.speed,
    this.delay,
    this.color,
  );
  factory _ShootingStar.random(double height, Random rand) {
    final startX = rand.nextDouble();
    final startY = rand.nextDouble() * 0.7;
    final length = rand.nextDouble() * 80 + 60;
    final angle = -pi / 4 + rand.nextDouble() * pi / 8;
    final speed = rand.nextDouble() * 0.3 + 0.7;
    final delay = rand.nextDouble();
    final color =
        [Colors.white, Colors.blueAccent, Colors.purpleAccent][rand.nextInt(3)];
    return _ShootingStar(startX, startY, length, angle, speed, delay, color);
  }
}

class _ShootingStarPainter extends CustomPainter {
  final List<_ShootingStar> stars;
  final double animationValue;
  _ShootingStarPainter(this.stars, this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    for (final star in stars) {
      double t = ((animationValue + star.delay) % 1.0);
      double x = star.startX * size.width + t * star.speed * size.width * 0.7;
      double y = star.startY * size.height + t * star.speed * size.height * 0.2;
      final Paint paint =
          Paint()
            ..shader = LinearGradient(
              colors: [
                star.color.withOpacity(0.0),
                star.color.withOpacity(0.7),
                star.color,
              ],
              stops: const [0.0, 0.7, 1.0],
            ).createShader(Rect.fromLTWH(x, y, star.length, 2));
      canvas.save();
      canvas.translate(x, y);
      canvas.rotate(star.angle);
      canvas.drawRect(Rect.fromLTWH(0, 0, star.length, 2.5), paint);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant _ShootingStarPainter oldDelegate) => true;
}
