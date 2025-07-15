import 'package:flutter/material.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String linkUrl;
  final Animation<double>? animation;
  const ProjectCard({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.linkUrl,
    this.animation,
    Key? key,
  }) : super(key: key);

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final card = AnimatedScale(
      scale: _hovered ? 1.04 : 1.0,
      duration: const Duration(milliseconds: 200),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white.withOpacity(0.08),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.18),
              blurRadius: 24,
              spreadRadius: 2,
            ),
          ],
          border: Border.all(
            color:
                _hovered
                    ? Theme.of(context).colorScheme.secondary.withOpacity(0.5)
                    : Colors.white.withOpacity(0.10),
            width: 2.2,
          ),
          backgroundBlendMode: BlendMode.luminosity,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: () => _launchUrl(widget.linkUrl),
          onHover: (hover) => setState(() => _hovered = hover),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    widget.imageUrl,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, error, stackTrace) => Container(
                          height: 120,
                          color: Colors.black26,
                          child: const Center(
                            child: Icon(
                              Icons.broken_image,
                              color: Colors.white38,
                              size: 40,
                            ),
                          ),
                        ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white.withOpacity(0.85),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(
                      Icons.open_in_new,
                      color: Theme.of(context).colorScheme.secondary,
                      size: 18,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'View Project',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
    if (widget.animation != null) {
      return FadeTransition(
        opacity: widget.animation!,
        child: SlideTransition(
          position: widget.animation!.drive(
            Tween(
              begin: const Offset(0, 0.12),
              end: Offset.zero,
            ).chain(CurveTween(curve: Curves.easeOut)),
          ),
          child: card,
        ),
      );
    }
    return card;
  }

  void _launchUrl(String url) {
    // For web, open in new tab
    // ignore: undefined_prefixed_name
    // This is a placeholder; you can use url_launcher for full support
  }
}
