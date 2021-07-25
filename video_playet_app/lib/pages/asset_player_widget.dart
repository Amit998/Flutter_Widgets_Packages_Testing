import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_playet_app/widgets/video_player_widget.dart';

class AssetPlayerWidget extends StatefulWidget {
  @override
  _AssetPlayerWidgetState createState() => _AssetPlayerWidgetState();
}

class _AssetPlayerWidgetState extends State<AssetPlayerWidget> {
  VideoPlayerController videoController;
  final asset = "assets/test1.mp4";

  @override
  void initState() {
    super.initState();
    videoController = VideoPlayerController.asset(asset)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => videoController.play());
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMuted = videoController.value.volume == 0;

    return Material(
      child: Column(
        children: [
          VideoPlayerWidget(
            controller: videoController,
          ),
          SizedBox(
            height: 30,
          ),
          if (videoController != null && videoController.value.initialized)
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.red,
              child: IconButton(
                  onPressed: () {
                    videoController.setVolume(isMuted ? 1 : 0);
                  },
                  icon: Icon(
                    isMuted ? Icons.volume_mute : Icons.volume_up,
                  ),
                  color: Colors.white),
            ),
        ],
      ),
    );
  }
}
