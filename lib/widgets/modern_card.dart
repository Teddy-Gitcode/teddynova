import 'package:flutter/material.dart';

class ModernCard extends StatelessWidget {
  final Widget child;
  const ModernCard({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: child,
    );
  }
}
