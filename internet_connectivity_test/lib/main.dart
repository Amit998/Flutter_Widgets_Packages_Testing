import 'dart:async';

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
        debugShowCheckedModeBanner: false,
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
  StreamSubscription subscription;
  StreamSubscription internetSubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    subscription = Connectivity().onConnectivityChanged.listen((result) {
      setState(() {
        this.result = result;
      });
    });

    internetSubscription =
        InternetConnectionChecker().onStatusChange.listen((status) {
      hasInternet = status == InternetConnectionChecker().hasConnection;

      setState(() {
        this.hasInternet = hasInternet;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    subscription.cancel();
    internetSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.dark,
        title: Text("Check Connectivity"),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "ConnectionStatus",
                style: TextStyle(fontSize: 20),
              ),
              if (result == ConnectivityResult.mobile)
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(Icons.mobile_friendly_outlined),
                  Text("Mobile Connected")
                ]),
              if (result == ConnectivityResult.wifi)
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.wifi), Text("WIFI Connected")]),
              if (result == ConnectivityResult.none)
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(Icons.wifi_lock),
                  Text("No Internet Connected")
                ]),
              SizedBox(
                height: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                hasInternet
                    ? Icon(
                        Icons.check,
                        color: Colors.green,
                        size: 20,
                      )
                    : Icon(
                        Icons.work_outline,
                        color: Colors.redAccent,
                        size: 20,
                      ),
                SizedBox(
                  width: 20,
                ),
                hasInternet
                    ? Text(
                        "Internet Status okay",
                        style: TextStyle(fontSize: 20),
                      )
                    : Text("Internet no found")
              ])
            ],
          ),
        ),
      ),
    );
  }
}
