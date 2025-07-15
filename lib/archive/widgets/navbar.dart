import 'package:flutter/material.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final void Function(String section)? onNav;
  const NavBar({Key? key, this.onNav}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.auto_awesome,
                    color: Theme.of(context).colorScheme.primary,
                    size: 32,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'TeddyNova',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  _NavButton(
                    label: 'Home',
                    icon: Icons.home,
                    section: 'hero',
                    onTap: onNav,
                  ),
                  _NavButton(
                    label: 'About',
                    icon: Icons.person,
                    section: 'about',
                    onTap: onNav,
                  ),
                  _NavButton(
                    label: 'Projects',
                    icon: Icons.rocket_launch,
                    section: 'projects',
                    onTap: onNav,
                  ),
                  _NavButton(
                    label: 'Contact',
                    icon: Icons.email,
                    section: 'contact',
                    onTap: onNav,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final String section;
  final void Function(String section)? onTap;
  const _NavButton({
    required this.label,
    required this.icon,
    required this.section,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => onTap?.call(section),
      icon: Icon(
        icon,
        color: Theme.of(context).colorScheme.secondary,
        size: 20,
      ),
      label: Text(
        label,
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: TextButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.secondary,
        padding: const EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}
