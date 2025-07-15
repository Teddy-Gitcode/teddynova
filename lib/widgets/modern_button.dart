import 'package:flutter/material.dart';

class ModernButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const ModernButton({required this.label, required this.onPressed, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
      ),
      child: Text(label),
    );
  }
}
