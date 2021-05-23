import 'package:flutter/material.dart';

class StatusPage extends StatefulWidget {
  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  final TransformationController _transformationController =
      TransformationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InteractiveViewer(
          onInteractionEnd: (value) {
            _transformationController.value = Matrix4.identity();
          },
          transformationController: _transformationController,
          child: Image.asset("assets/status.jpg")),
    );
  }
}
