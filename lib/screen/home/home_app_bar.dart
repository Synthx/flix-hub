import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Remix.search_line),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Remix.menu_line),
        ),
      ],
    );
  }
}
