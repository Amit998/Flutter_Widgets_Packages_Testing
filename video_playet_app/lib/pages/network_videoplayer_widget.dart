import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_playet_app/widgets/video_player_widget.dart';

final urlLanscapeVideo = "https://youtu.be/gMmYGRihC98";

class NetworkPlayerWidget extends StatefulWidget {
  @override
  _NetworkPlayerWidgetState createState() => _NetworkPlayerWidgetState();
}

class _NetworkPlayerWidgetState extends State<NetworkPlayerWidget> {
  VideoPlayerController videoController;
  final textController = TextEditingController(text: urlLanscapeVideo);

  @override
  void initState() {
    super.initState();
    videoController = VideoPlayerController.network(textController.text)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => videoController.play());
    setState(() {});

    videoController.setVolume(1);
  }

  @override
  void dispose() {
    videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          VideoPlayerWidget(controller: videoController),
          buildTextField(),
        ],
      ),
    ));
  }

  Widget buildTextField() => Container(
        padding: EdgeInsets.all(32),
        child: Row(
          children: [
            Expanded(
                child: TextField(
                    controller: textController,
                    decoration: InputDecoration(hintText: "Enter Video Url"))),
            SizedBox(
              width: 12,
            ),
            FloatingActionButton(
              onPressed: () {
                if (textController.text.trim().isEmpty) return;
                videoController =
                    VideoPlayerController.network(textController.text.trim())
                      ..addListener(() => setState(() {}))
                      ..setLooping(true)
                      ..initialize().then((_) => videoController.play());
                setState(() {});
              },
              child: Icon(
                Icons.add,
                size: 40,
              ),
            )
          ],
        ),
      );
}
