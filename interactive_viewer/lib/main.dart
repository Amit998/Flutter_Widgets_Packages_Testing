import 'package:flutter/material.dart';
import 'package:interactive_viewer/gallery_page.dart';
import 'package:interactive_viewer/status_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StatusPage(),
    );
  }
}
