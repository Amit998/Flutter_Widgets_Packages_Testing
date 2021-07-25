import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_playet_app/widgets/video_player_widget.dart';

class FilePlayerWidget extends StatefulWidget {
  @override
  _FilePlayerWidgetState createState() => _FilePlayerWidgetState();
}

class _FilePlayerWidgetState extends State<FilePlayerWidget> {
  VideoPlayerController videoController;
  final File file = File('assets/test1.mp4');

  @override
  void initState() {
    super.initState();
    videoController = VideoPlayerController.file(file)
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
    final isMuted = videoController.value.volume == 0;

    return Material(
      child: Scaffold(
        body: Column(
          children: [
            VideoPlayerWidget(controller: videoController),
            buildAddButton(),
          ],
        ),
      ),
    );
  }

  Widget buildAddButton() => Container(
        padding: EdgeInsets.all(32),
        child: FloatingActionButton(
          onPressed: () async {
            final file = await pickVideoFile();
            if (file == null) return;
            videoController = VideoPlayerController.file(file)
              ..addListener(() => setState(() {}))
              ..setLooping(true)
              ..initialize().then((_) => videoController.play());
            setState(() {});
          },
        ),
      );

  Future<File> pickVideoFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.video);

    if (result == null) return null;

    return File(result.files.single.path);
  }
}
