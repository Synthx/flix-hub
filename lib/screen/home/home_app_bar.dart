import 'package:flutter/material.dart';
import 'package:live_coding/core/core.dart';
import 'package:live_coding/theme/theme.dart';
import 'package:live_coding/widget/widget.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight + context.topSafeArea,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black, Colors.transparent],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: context.topSafeArea,
          left: kSafeArea,
          right: kSafeArea,
        ),
        child: Row(
          children: [
            KitButton(
              size: KitButtonSize.small,
              child: const Text('Movie'),
              onTap: () {},
            ),
            const SizedBox(width: kSpacer),
            KitButton(
              size: KitButtonSize.small,
              variant: KitButtonVariant.secondary,
              child: const Text('Series'),
              onTap: () {},
            ),
            const Spacer(),
            Container(
              height: 54,
              width: 54,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(99),
                image: const DecorationImage(
                  image: AssetImage('assets/images/avatar.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
