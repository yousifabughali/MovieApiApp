import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerScreen extends StatefulWidget {
  String trailerKey;

  TrailerScreen({required this.trailerKey, Key? key}) : super(key: key);

  @override
  State<TrailerScreen> createState() => _TrailerScreenState();
}

class _TrailerScreenState extends State<TrailerScreen> {
  late YoutubePlayerController youtubePlayerController;

  @override
  void initState() {
    super.initState();
    String url = 'https://www.youtube.com/watch?v=${widget.trailerKey}';
    youtubePlayerController = YoutubePlayerController(
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        loop: false,
      ),
        initialVideoId: YoutubePlayer.convertUrlToId(url)!,
    );
    // youtubePlayerController.toggleFullScreenMode();


  }

  @override
  void deactivate() {
    youtubePlayerController.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    youtubePlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller:youtubePlayerController,
      ),
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(title: Text('Trailer')),
          body: Center(
            child: Container(
              // width: double.infinity,
              child: player,
            ),
          ),


        );
      },
    );
  }
}
