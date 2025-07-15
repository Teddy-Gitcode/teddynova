import 'package:flutter/material.dart';

class GlowingAvatar extends StatefulWidget {
  final double size;
  final ImageProvider? image;
  const GlowingAvatar({Key? key, this.size = 120, this.image})
    : super(key: key);

  @override
  State<GlowingAvatar> createState() => _GlowingAvatarState();
}

class _GlowingAvatarState extends State<GlowingAvatar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
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
        return Container(
          width: widget.size,
          height: widget.size,
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Glowing aura
              Container(
                width: widget.size * (1.15 + 0.05 * _controller.value),
                height: widget.size * (1.15 + 0.05 * _controller.value),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Colors.blueAccent.withOpacity(
                        0.18 + 0.10 * _controller.value,
                      ),
                      Colors.purpleAccent.withOpacity(
                        0.14 + 0.10 * (1 - _controller.value),
                      ),
                      Colors.transparent,
                    ],
                    stops: const [0.0, 0.7, 1.0],
                  ),
                ),
              ),
              // Avatar image
              CircleAvatar(
                radius: widget.size / 2,
                backgroundImage:
                    widget.image ??
                    const AssetImage('assets/avatar_placeholder.png'),
                backgroundColor: Colors.black,
              ),
            ],
          ),
        );
      },
    );
  }
}
