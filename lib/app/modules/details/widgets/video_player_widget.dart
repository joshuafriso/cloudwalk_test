import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerWidget extends StatelessWidget {
  final String url;
  const VideoPlayerWidget({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    final videoId = YoutubePlayer.convertUrlToId(url);
    final YoutubePlayerController controller = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(
          mute: true,
          autoPlay: false,
        ));
    return YoutubePlayer(
      controller: controller,
    );
  }
}
