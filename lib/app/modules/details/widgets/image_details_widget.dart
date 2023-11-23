import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloudwalk_test/app/shared/utils/youtube_thumb_url_converter.dart';
import 'package:cloudwalk_test/app/shared/widgets/loading_defautl_widget.dart';
import 'package:flutter/material.dart';

class ImageDetailsWidget extends StatelessWidget {
  final String mediaType;
  final String imgUrl;
  final String? imgHdUrl;
  const ImageDetailsWidget(
      {super.key,
      required this.mediaType,
      required this.imgUrl,
      this.imgHdUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: mediaType == 'image'
          ? imgHdUrl!
          : YoutubeThumbUrlConverter.getThumbVideo(imgUrl),
      placeholder: (context, url) =>
          const Center(child: LoadingDefautlWidget()),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
