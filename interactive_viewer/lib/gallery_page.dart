import 'package:flutter/material.dart';

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

List<String> images = [
  'assets/canon1.jpg',
  'assets/canon2.jpg',
  'assets/canon3.jpg',
  'assets/canon3.jpg',
];

class _GalleryPageState extends State<GalleryPage> {
  String _currentImage = images[0];
  final TransformationController _controller = TransformationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "E-Shop Gallery",
              style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "cannon 2500",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
                child: InteractiveViewer(
                    transformationController: _controller,
                    maxScale: 5.0,
                    child: Image.asset(_currentImage))),
            Container(
              height: 80,
              // width: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        print(index);
                        setState(() {
                          _currentImage = images[index];
                          _controller.value = Matrix4.identity();
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.orange)),
                        child: Image.asset(images[index]),
                      ),
                    );
                  }),
            )
          ],
        ),
      )),
    );
  }
}
