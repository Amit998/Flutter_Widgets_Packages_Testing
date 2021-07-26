import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
        title: 'Check Connectivity',
        theme: ThemeData.dark().copyWith(),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool hasInternet = false;
  ConnectivityResult result = ConnectivityResult.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.dark,
        title: Text("Check Connectivity"),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 30),
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          child: Text("Checl Internet"),
          onPressed: () async {
            hasInternet = await InternetConnectionChecker().hasConnection;

            result = await Connectivity().checkConnectivity();

            final color = hasInternet ? Colors.green : Colors.red;
            final text = hasInternet ? 'Internet' : 'No Internet';

            if (result == ConnectivityResult.mobile) {
              showSimpleNotification(
                  Text(
                    text + " Mobile Network",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  background: color);
            } else if (result == ConnectivityResult.wifi) {
              showSimpleNotification(
                  Text(
                    text + " Wifi Network",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  background: color);
            } else {
              showSimpleNotification(
                  Text(
                    text + " None",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  background: color);
            }
          },
        ),
      ),
    );
  }
}
