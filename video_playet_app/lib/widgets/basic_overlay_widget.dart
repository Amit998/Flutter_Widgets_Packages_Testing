import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class BasicOverlayWidet extends StatelessWidget {
  final VideoPlayerController controller;

  const BasicOverlayWidet({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          controller.value.isPlaying ? controller.pause() : controller.play();
        },
        child: Stack(
          children: [
            buildPlay(),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: buildIndicator(),
            )
          ],
        ),
      );

  Widget buildIndicator() => VideoProgressIndicator(
        controller,
        allowScrubbing: true,
      );
  Widget buildPlay() => controller.value.isPlaying
      ? Container()
      : Container(
          alignment: Alignment.center,
          color: Colors.black26,
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 50,
              )));
}
