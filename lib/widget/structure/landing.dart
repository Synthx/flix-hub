import 'package:flutter/material.dart';
import 'package:live_coding/core/core.dart';
import 'package:live_coding/widget/widget.dart';

class KitSliverLanding extends StatelessWidget {
  final String? path;
  final Widget child;

  const KitSliverLanding({
    required this.child,
    this.path,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = 480 + context.topSafeArea;
    return SliverAppBar(
      collapsedHeight: height,
      expandedHeight: height,
      snap: false,
      pinned: false,
      floating: false,
      stretch: true,
      automaticallyImplyLeading: false,
      flexibleSpace: Stack(
        children: [
          ShaderMask(
            shaderCallback: (rect) => const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black],
            ).createShader(Rect.fromLTRB(
              0,
              -10,
              rect.width,
              rect.height - 20,
            )),
            blendMode: BlendMode.darken,
            child: KitPicture(path),
          ),
          child,
        ],
      ),
    );
  }
}
