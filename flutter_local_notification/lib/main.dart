import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() {
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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var androidInitilize =
        new AndroidInitializationSettings("Social-media-512");
    var iOSinitilize = new IOSInitializationSettings();

    var initilizetionsSettings =
        new InitializationSettings(androidInitilize, iOSinitilize);

    var fltrNotification = new FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(initilizetionsSettings,
        onSelectNotification: notification);
  }

  Future _showNotification() async {
    print("object");
    var androidDetails = new AndroidNotificationDetails(
        "channelId", "channelName", "channelDescription",
        importance: Importance.High, priority: Priority.High);
    var iOSDetails = new IOSNotificationDetails();

    var generalNotificationDetails =
        new NotificationDetails(androidDetails, iOSDetails);

    await flutterLocalNotificationsPlugin.show(
        0, "title", "body", generalNotificationDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: RaisedButton(
          onPressed: _showNotification,
          child: Text("Press"),
        ),
      ),
    );
  }

  Future notification(String payload) async {}
}
