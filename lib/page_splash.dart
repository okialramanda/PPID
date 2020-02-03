import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get_version/get_version.dart';
import 'package:flutter/services.dart';
import 'package:unpppid/responsive_screen.dart';
import 'package:unpppid/webview.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Screen size;
  String projectVersion = "";
  String platformVersion = 'Unknown';
  @override
  void initState() {
    super.initState();
    version();
    Timer(Duration(seconds: 2), () {
      navigateFromSplash();
    });
  }

  void version() async {
    try {
      projectVersion = await GetVersion.projectVersion;
    } on PlatformException {
      projectVersion = 'error';
    }

    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await GetVersion.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    setState(() => this.projectVersion = projectVersion);
    setState(() => this.platformVersion = platformVersion);
  }

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    return Scaffold(
        body: Center(
            child: Column(
      children: <Widget>[
        Expanded(
          child: Align(
              alignment: FractionalOffset.center,
              child: Container(
                  padding: EdgeInsets.only(top: 150.0),
                  width: size.getWidthPx(600),
                  height: size.getWidthPx(600),
                  child: Image.asset("assets/logo_splash.png"))),
        ),
        Expanded(
          child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child:
                      Text("Version : " + projectVersion + " UPT.PTIK UNP "))),
        ),
      ],
    )));
  }

  Future navigateFromSplash() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Webview()));
  }
}
