import 'package:flutter/material.dart';
import 'package:live_coding/core/core.dart';
import 'package:live_coding/data/data.dart';
import 'package:live_coding/widget/widget.dart';

class KitVideoCard extends StatelessWidget {
  final Video video;

  const KitVideoCard({
    required this.video,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(12),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: KitChip.text(
            context.t.videoType(video.type.name),
          ),
        ),
      ),
    );
  }
}
