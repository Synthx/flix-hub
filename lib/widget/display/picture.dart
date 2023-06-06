import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_coding/store/store.dart';
import 'package:remixicon/remixicon.dart';

enum KitPictureFormat {
  original,
}

class KitPicture extends StatelessWidget {
  final String path;
  final KitPictureFormat format;

  const KitPicture({
    required this.path,
    this.format = KitPictureFormat.original,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ConfigStore, ConfigState, String?>(
      selector: (state) => state.baseImageUrl,
      builder: (context, baseImageUrl) {
        if (baseImageUrl == null) {
          return const Center(
            child: Icon(Remix.image_line),
          );
        }

        return CachedNetworkImage(
          imageUrl: '$baseImageUrl/$format/$path',
          errorWidget: (context, url, error) => const Center(
            child: Icon(Remix.image_line),
          ),
        );
      },
    );
  }
}
