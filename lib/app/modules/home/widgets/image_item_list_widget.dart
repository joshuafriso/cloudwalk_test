import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloudwalk_test/app/shared/models/nasa_apod_model.dart';
import 'package:cloudwalk_test/app/shared/utils/app_colors.dart';
import 'package:cloudwalk_test/app/shared/utils/youtube_thumb_url_converter.dart';
import 'package:cloudwalk_test/app/shared/widgets/loading_defautl_widget.dart';
import 'package:flutter/material.dart';

class ImageItemListWidget extends StatelessWidget {
  final NasaApodModel model;
  const ImageItemListWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: model.mediaType == 'image'
                ? model.imgUrl!
                : YoutubeThumbUrlConverter.getThumbVideo(model.imgUrl!),
            placeholder: (context, url) => const LoadingDefautlWidget(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Text(
            model.title!,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primary),
          ),
          Text(
            model.date!,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
