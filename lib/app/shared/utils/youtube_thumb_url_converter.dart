import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeThumbUrlConverter {
  static String getThumbVideo(String url) {
    final videoId = YoutubePlayer.convertUrlToId(url);
    return "https://img.youtube.com/vi/$videoId/hqdefault.jpg";
  }
}
