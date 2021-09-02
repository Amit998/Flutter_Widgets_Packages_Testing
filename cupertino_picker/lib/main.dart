import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(body: MainPage()),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final items = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
  ];

  @override
  void initState() {
    super.initState();
    scrollController = FixedExtentScrollController(initialItem: index);
    textController = TextEditingController(text: items[index]);
  }

  int index = 0;

  FixedExtentScrollController scrollController;
  TextEditingController textController;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(
            //   items[index],
            //   textAlign: TextAlign.center,
            //   style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            // ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              child: CupertinoTextField(
                readOnly: true,
                enableInteractiveSelection: false,
                controller: textController,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),

            const SizedBox(
              height: 24,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CupertinoButton.filled(
                  child: Text(
                    "Open Picker",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    scrollController.dispose();
                    scrollController =
                        FixedExtentScrollController(initialItem: index);
                    showCupertinoModalPopup(
                        context: context,
                        builder: (builder) => CupertinoActionSheet(
                              actions: [buildPicker()],
                              cancelButton: CupertinoActionSheetAction(
                                child: Text("Cancel"),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ));
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget buildPicker() => SizedBox(
        height: 350,
        child: StatefulBuilder(
          builder: (context, setState) => CupertinoPicker(
            selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
              background: CupertinoColors.activeBlue.withOpacity(0.2),
            ),
            scrollController: scrollController,
            looping: true,
            itemExtent: 64,
            onSelectedItemChanged: (index) {
              setState(() {
                this.index = index;
              });

              final item = items[index];
              textController.text = item;

              print('Selected Item: ${item}');
            },
            // children: items
            //     .map((item) => Center(
            //             child: Text(
            //           item,
            //           style: TextStyle(fontSize: 32),
            //         )))
            //     .toList()

            children: List.generate(items.length, (index) {
              final isSelected = this.index == index;

              final color = isSelected
                  ? CupertinoColors.activeBlue
                  : CupertinoColors.black;

              final item = items[index];

              return Center(
                child: Text(
                  item,
                  style: TextStyle(fontSize: 32, color: color),
                ),
              );
            }),
          ),
        ),
      );
}
