import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:live_coding/widget/widget.dart';
import 'package:remixicon/remixicon.dart';

class MovieDetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MovieDetailAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Future _close({
    required BuildContext context,
  }) async {
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
            onTap: () => _close(context: context),
          ),
        ],
      ),
    );
  }
}
