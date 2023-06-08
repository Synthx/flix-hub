import 'package:flutter/material.dart';

class KitIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const KitIconButton(
    this.icon, {
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      style: IconButton.styleFrom(
        backgroundColor: const Color(0x66CACACA),
        padding: const EdgeInsets.all(12),
      ),
      icon: Icon(
        icon,
        size: 28,
        color: const Color(0xFFFFFFFF),
      ),
    );
  }
}
