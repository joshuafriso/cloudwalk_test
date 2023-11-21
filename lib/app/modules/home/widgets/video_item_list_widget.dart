import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloudwalk_test/app/shared/models/nasa_apod_model.dart';
import 'package:cloudwalk_test/app/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoItemListWidget extends StatelessWidget {
  final NasaApodModel model;
  const VideoItemListWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final videoId = YoutubePlayer.convertUrlToId(model.imgUrl!);
    // final YoutubePlayerController controller = YoutubePlayerController(
    //     initialVideoId: videoId!,
    //     flags: const YoutubePlayerFlags(
    //       mute: true,
    //       autoPlay: false,
    //     ));
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: "https://img.youtube.com/vi/$videoId/hqdefault.jpg",
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          // YoutubePlayer(
          //   controller: controller,
          // ),
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
