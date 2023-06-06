import 'package:flutter/material.dart';

class KitButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;

  const KitButton({
    required this.child,
    this.onTap,
    super.key,
  });

  factory KitButton.text(
    String text, {
    VoidCallback? onTap,
  }) {
    return KitButton(
      onTap: onTap,
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFFFFFF),
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(99),
        ),
        textStyle: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: Color(0xFF000000),
        ),
      ),
      child: child,
    );
  }
}
