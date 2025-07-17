import 'package:flutter/material.dart';

class SpaceHubSection extends StatelessWidget {
  const SpaceHubSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF1A2A44), Color(0xFF4CAF50)],
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 56 : 112,
        horizontal: isMobile ? 8 : 64,
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'Space Hub',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 24),
            // TODO: Implement Space Observatory Widget here
            // Placeholder for rotating Earth and animated constellations
            // Placeholder for NASA data ticker
            Text(
              'Coming Soon: Interactive Space Observatory',
              style: TextStyle(color: Colors.white70, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
