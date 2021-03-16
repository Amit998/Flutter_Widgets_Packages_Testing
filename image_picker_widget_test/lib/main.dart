import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _image;

  ImagePicker imagePicker;

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // height: 200,
              // width: 200,
              margin: EdgeInsets.only(bottom: 40),
              child: _image != null
                  ? Image.file(_image)
                  : Icon(
                      Icons.image,
                      size: 100,
                    ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: RaisedButton(
                onPressed: choseImageFromGallery,
                onLongPress: choseImageFromCamera,
                child: Text("Hello World"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void choseImageFromGallery() async {
    PickedFile pickedFile =
        await imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedFile.path);
    });
  }

  void choseImageFromCamera() async {
    PickedFile pickedFileFromCamera =
        await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      _image = File(pickedFileFromCamera.path);
    });
  }
}
