import 'dart:math';
import 'package:flutter/material.dart';

class OrbitingSocialIcons extends StatefulWidget {
  final double size;
  const OrbitingSocialIcons({Key? key, this.size = 120}) : super(key: key);

  @override
  State<OrbitingSocialIcons> createState() => _OrbitingSocialIconsState();
}

class _OrbitingSocialIconsState extends State<OrbitingSocialIcons>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<_SocialIconData> icons = [
    _SocialIconData(Icons.code, 'https://github.com/teddynova'),
    _SocialIconData(Icons.business, 'https://linkedin.com/in/teddynova'),
    _SocialIconData(Icons.email, 'mailto:hello@teddynova.com'),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double r = widget.size / 2.2;
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Central planet/icon
          Container(
            width: widget.size * 0.38,
            height: widget.size * 0.38,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const RadialGradient(
                colors: [Color(0xFF3A8DFF), Color(0xFF0A0F2C)],
                stops: [0.0, 1.0],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueAccent.withOpacity(0.25),
                  blurRadius: 16,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: const Icon(Icons.public, color: Colors.white, size: 32),
          ),
          // Orbiting icons
          ...List.generate(icons.length, (i) {
            final angle =
                2 * pi * (i / icons.length) + _controller.value * 2 * pi;
            final offset = Offset(r * cos(angle), r * sin(angle));
            return Positioned(
              left: widget.size / 2 + offset.dx - 22,
              top: widget.size / 2 + offset.dy - 22,
              child: GestureDetector(
                onTap: () => _launchUrl(icons[i].url),
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.10),
                    border: Border.all(
                      color: Colors.blueAccent.withOpacity(0.5),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueAccent.withOpacity(0.18),
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Icon(icons[i].icon, color: Colors.white, size: 22),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  void _launchUrl(String url) {
    // For web, open in new tab
    // ignore: undefined_prefixed_name
    // This is a placeholder; you can use url_launcher for full support
  }
}

class _SocialIconData {
  final IconData icon;
  final String url;
  const _SocialIconData(this.icon, this.url);
}
