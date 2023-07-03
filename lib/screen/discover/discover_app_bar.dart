import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:live_coding/widget/widget.dart';
import 'package:remixicon/remixicon.dart';

class DiscoverAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DiscoverAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  void _goBack({
    required BuildContext context,
  }) {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      forceMaterialTransparency: true,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          KitIconButton(
            Remix.arrow_left_s_line,
            onTap: () => _goBack(
              context: context,
            ),
          ),
        ],
      ),
    );
  }
}
