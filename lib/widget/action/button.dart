import 'package:flutter/material.dart';
import 'package:live_coding/core/core.dart';

enum KitButtonVariant {
  primary,
  secondary,
}

enum KitButtonSize {
  small,
  medium,
}

Color _backgroundColor({
  required BuildContext context,
  required KitButtonVariant variant,
}) {
  switch (variant) {
    case KitButtonVariant.primary:
      return context.primaryColor;
    case KitButtonVariant.secondary:
      return const Color(0x66CACACA);
  }
}

Color _textColor({
  required KitButtonVariant variant,
}) {
  switch (variant) {
    case KitButtonVariant.primary:
    case KitButtonVariant.secondary:
      return const Color(0xFFFFFFFF);
  }
}

class KitButton extends StatelessWidget {
  final VoidCallback? onTap;
  final KitButtonVariant variant;
  final KitButtonSize size;
  final Widget child;

  const KitButton({
    required this.child,
    this.variant = KitButtonVariant.primary,
    this.size = KitButtonSize.medium,
    this.onTap,
    super.key,
  });

  factory KitButton.text(
    String text, {
    KitButtonVariant variant = KitButtonVariant.primary,
    KitButtonSize size = KitButtonSize.medium,
    VoidCallback? onTap,
  }) {
    final textColor = _textColor(
      variant: variant,
    );

    return KitButton(
      onTap: onTap,
      variant: variant,
      size: size,
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
    KitButtonSize size = KitButtonSize.medium,
    VoidCallback? onTap,
  }) {
    final textColor = _textColor(
      variant: variant,
    );

    return KitButton(
      onTap: onTap,
      variant: variant,
      size: size,
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
        elevation: 0,
        backgroundColor: _backgroundColor(
          context: context,
          variant: variant,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(99),
        ),
        textStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Color(0xFFFFFFFF),
        ),
      ),
      child: child,
    );
  }
}
