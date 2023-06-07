import 'package:flutter/material.dart';
import 'package:live_coding/core/core.dart';

enum KitButtonVariant {
  primary,
  secondary,
}

Color _backgroundColor({
  required BuildContext context,
  required KitButtonVariant variant,
  required bool reversed,
}) {
  switch (variant) {
    case KitButtonVariant.primary:
      return reversed ? const Color(0xFFFFFFFF) : context.primaryColor;
    case KitButtonVariant.secondary:
      return const Color(0x66CACACA);
  }
}

Color _textColor({
  required KitButtonVariant variant,
  required bool reversed,
}) {
  switch (variant) {
    case KitButtonVariant.primary:
      return reversed ? const Color(0xFF000000) : const Color(0xFFFFFFFF);
    case KitButtonVariant.secondary:
      return const Color(0xFFFFFFFF);
  }
}

class KitButton extends StatelessWidget {
  final VoidCallback? onTap;
  final KitButtonVariant variant;
  final bool reversed;
  final Widget child;

  const KitButton({
    required this.child,
    this.variant = KitButtonVariant.primary,
    this.reversed = false,
    this.onTap,
    super.key,
  });

  factory KitButton.text(
    String text, {
    KitButtonVariant variant = KitButtonVariant.primary,
    bool reversed = false,
    VoidCallback? onTap,
  }) {
    final textColor = _textColor(
      variant: variant,
      reversed: reversed,
    );

    return KitButton(
      onTap: onTap,
      variant: variant,
      reversed: reversed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }

  factory KitButton.icon(
    String text, {
    required IconData icon,
    KitButtonVariant variant = KitButtonVariant.primary,
    bool reversed = false,
    VoidCallback? onTap,
  }) {
    final textColor = _textColor(
      variant: variant,
      reversed: reversed,
    );

    return KitButton(
      onTap: onTap,
      variant: variant,
      reversed: reversed,
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: textColor,
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: _backgroundColor(
          context: context,
          variant: variant,
          reversed: reversed,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(99),
        ),
      ),
      child: child,
    );
  }
}
