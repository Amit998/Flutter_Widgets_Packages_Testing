import 'package:flutter/material.dart';
import 'package:flutter_background_test_2/local_notification.dart';

import 'package:workmanager/workmanager.dart';

void callbackDispatcher() {
  Workmanager.executeTask((taskName, inputData) async {
    // print("object");
    // LocalNotification.Initializer();
    // LocalNotification.ShowOneTimeNotification(DateTime.now());
    return Future.value(true);
  });
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Workmanager.initialize(callbackDispatcher);
  await Workmanager.registerPeriodicTask("uniqueName", "taskName",
      frequency: Duration(minutes: 15),
      inputData: {
        "Data1": "InputData1",
        "Data2": "InputData2",
      });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}
