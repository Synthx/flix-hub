import 'package:flutter/material.dart';

class KitChip extends StatelessWidget {
  final Widget child;

  const KitChip({
    required this.child,
    super.key,
  });

  factory KitChip.text(String text) {
    return KitChip(
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xE51E1E1E),
        borderRadius: BorderRadius.circular(6),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: child,
    );
  }
}
