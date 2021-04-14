import 'package:flutter/material.dart';
import 'package:navigating_drawer/drawer_list_tile.dart';

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
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Drawer"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.deepOrange,
                Colors.orangeAccent,
                // Colors.deepOrangeAccent
              ])),
              child: Header(),
            ),
            GestureDetector(
              child: CustomListTile(
                text: "Profile",
                icon: Icons.person,
                onTab: () {},
              ),
            ),
            CustomListTile(
              text: "Notification",
              icon: Icons.notification_important,
              onTab: () {},
            ),
            CustomListTile(
              text: "Settings",
              icon: Icons.settings,
              onTab: () {},
            ),
            CustomListTile(
              text: "Logout",
              icon: Icons.logout,
              onTab: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          elevation: 10,
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              "https://raw.githubusercontent.com/flutter-rus/flutter-rus.github.io/master/images/logo.png",
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Flutter",
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
