import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:live_coding/core/core.dart';
import 'package:live_coding/data/data.dart';
import 'package:live_coding/theme/theme.dart';

class DiscoverSortByBottomSheet extends StatelessWidget {
  final SortBy sortBy;

  const DiscoverSortByBottomSheet({
    required this.sortBy,
    super.key,
  });

  void _close({
    required BuildContext context,
    SortBy? sortBy,
  }) {
    context.pop(sortBy);
  }

  @override
  Widget build(BuildContext context) {
    const options = SortBy.values;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(kBorderRadius),
          topRight: Radius.circular(kBorderRadius),
        ),
      ),
      padding: EdgeInsets.only(
        left: kSafeArea,
        right: kSafeArea,
        top: kSafeArea,
        bottom: kSafeArea + context.bottomSafeArea,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: options.length,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final option = options[index];
          final selectedColor = context.primaryColor;
          final color = context.textStyle.bodyMedium?.color;

          return ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: kSafeArea,
              vertical: 0,
            ),
            leading: Icon(
              option.icon,
              color: sortBy == option ? selectedColor : color,
            ),
            title: Text(
              context.t.sortBy(option.name),
              style: context.textStyle.bodyMedium?.copyWith(
                color: sortBy == option ? selectedColor : color,
              ),
            ),
            onTap: () => _close(
              context: context,
              sortBy: option,
            ),
          );
        },
      ),
    );
  }
}
