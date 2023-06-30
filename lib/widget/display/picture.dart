import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_coding/store/store.dart';
import 'package:remixicon/remixicon.dart';

enum KitPictureFormat {
  original('original');

  final String value;

  const KitPictureFormat(this.value);
}

class KitPicture extends StatelessWidget {
  final KitPictureFormat format;
  final String? path;
  final BorderRadius? borderRadius;

  const KitPicture(
    this.path, {
    this.format = KitPictureFormat.original,
    this.borderRadius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ConfigStore, ConfigState, String?>(
      selector: (state) => state.baseImageUrl,
      builder: (context, baseImageUrl) {
        if (baseImageUrl == null || path == null) {
          return const Center(
            child: Icon(Remix.image_line),
          );
        }

        return CachedNetworkImage(
          imageUrl: '$baseImageUrl${format.value}$path',
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: Theme.of(context).cardColor,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),
          progressIndicatorBuilder: (context, url, download) => Center(
            child: CircularProgressIndicator(
              value: download.progress,
            ),
          ),
          errorWidget: (context, url, error) => const Center(
            child: Icon(Remix.image_line),
          ),
        );
      },
    );
  }
}
