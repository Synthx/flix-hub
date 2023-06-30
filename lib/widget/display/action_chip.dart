import 'package:flutter/material.dart';
import 'package:live_coding/core/core.dart';

class KitActionChip extends StatelessWidget {
  final bool selected;
  final Widget child;
  final VoidCallback? onTap;

  const KitActionChip({
    required this.child,
    this.selected = false,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      elevation: 0,
      side: BorderSide.none,
      label: child,
      backgroundColor:
          selected ? context.primaryColor : const Color(0x66CACACA),
      labelStyle: const TextStyle(
        color: Color(0xFFFFFFFF),
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(24),
      ),
      onPressed: () => onTap?.call(),
    );
  }
}
