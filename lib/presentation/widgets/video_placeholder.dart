import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LazyYouTubePlayer extends StatefulWidget {
  final String videoUrl;

  const LazyYouTubePlayer({super.key, required this.videoUrl});

  @override
  LazyYouTubePlayerState createState() {
    return LazyYouTubePlayerState();
  }
}

class LazyYouTubePlayerState extends State<LazyYouTubePlayer> {
  bool isPlayerVisible = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPlayerVisible = true;
        });
      },
      child: isPlayerVisible
          ? YoutubePlayer(
        controller: YoutubePlayerController(
          initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl)!,
          flags: const YoutubePlayerFlags(autoPlay: true),
        ),
        showVideoProgressIndicator: true,
      )
          : Container(
        height: 200,
        color: Colors.black,
        child: const Center(
          child: Icon(Icons.play_arrow, color: Colors.white, size: 50),
        ),
      ),
    );
  }
}
