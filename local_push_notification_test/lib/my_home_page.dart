import 'package:flutter/material.dart';
import 'package:local_push_notification_test/notifivationApi.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.yellowAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(
              size: 180,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Local\nNotification",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            buildButton(context,
                title: "Simple Notification",
                onTap: () => NotificationApi.showNotification(
                      id: 1,
                      title: "Amit Dutta",
                      body:
                          "Due to limitations currently within the macOS Flutter engine, getNotificationAppLaunchDetails will return null on macOS versions older than 10.14. These limitations will mean that conflicts may occur when using this plugin with other notification plugins (e.g. for push notifications).",
                      payload: "sarah.abs",
                    ),
                iconData: Icons.alarm),
            buildButton(context,
                title: "Schedule Notification",
                onTap: () {},
                iconData: Icons.schedule_send),
            buildButton(context,
                title: "Remove Notification",
                onTap: () {},
                iconData: Icons.remove_circle_outline)
          ],
        ),
      ),
    );
  }

  Container buildButton(BuildContext context,
      {String? title, IconData? iconData, VoidCallback? onTap}) {
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.8,
      height: 60,
      margin: EdgeInsets.only(top: 20),
      child: RaisedButton(
        onPressed: onTap!,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              iconData!,
              size: 30,
            ),
            SizedBox(
              width: 30,
            ),
            Text(
              title!,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
