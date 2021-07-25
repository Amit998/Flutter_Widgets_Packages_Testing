import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_playet_app/widgets/basic_overlay_widget.dart';


class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoPlayerWidget({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      controller != null && controller.value.initialized
          ? Container(
              alignment: Alignment.topCenter,
              child: buildVideo(),
            )
          : Container(
              height: 200,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );

  Widget buildVideo() => Stack(
        children: [
          buildVideoPlayer(),
          Positioned.fill(child: BasicOverlayWidet(controller: controller))
        ],
      );

  Widget buildVideoPlayer() => AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: VideoPlayer(controller));
}

