import 'package:flutter/material.dart';

class KitIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const KitIconButton({
    required this.icon,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      style: IconButton.styleFrom(
        backgroundColor: const Color(0xFF000000),
        padding: const EdgeInsets.all(0),
      ),
      icon: Icon(
        icon,
        size: 22,
        color: const Color(0xFFFFFFFF),
      ),
    );
  }
}
