import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:unpppid/util.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';

class Webview extends StatefulWidget {
  @override
  _WebviewState createState() => _WebviewState();
}

class BlackClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width / 2, size.height - 50.0);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ZigZagClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(3.0, size.height - 10.0);

    var firstControlPoint = Offset(23.0, size.height - 40.0);
    var firstEndPoint = Offset(38.0, size.height - 5.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(58.0, size.height - 40.0);
    var secondEndPoint = Offset(75.0, size.height - 5.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    var thirdControlPoint = Offset(93.0, size.height - 40.0);
    var thirdEndPoint = Offset(110.0, size.height - 5.0);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    var fourthControlPoint = Offset(128.0, size.height - 40.0);
    var fourthEndPoint = Offset(150.0, size.height - 5.0);
    path.quadraticBezierTo(fourthControlPoint.dx, fourthControlPoint.dy,
        fourthEndPoint.dx, fourthEndPoint.dy);

    var fifthControlPoint = Offset(168.0, size.height - 40.0);
    var fifthEndPoint = Offset(185.0, size.height - 5.0);
    path.quadraticBezierTo(fifthControlPoint.dx, fifthControlPoint.dy,
        fifthEndPoint.dx, fifthEndPoint.dy);

    var sixthControlPoint = Offset(205.0, size.height - 40.0);
    var sixthEndPoint = Offset(220.0, size.height - 5.0);
    path.quadraticBezierTo(sixthControlPoint.dx, sixthControlPoint.dy,
        sixthEndPoint.dx, sixthEndPoint.dy);

    var sevenControlPoint = Offset(240.0, size.height - 40.0);
    var sevenEndPoint = Offset(255.0, size.height - 5.0);
    path.quadraticBezierTo(sevenControlPoint.dx, sevenControlPoint.dy,
        sevenEndPoint.dx, sevenEndPoint.dy);

    var eightControlPoint = Offset(275.0, size.height - 40.0);
    var eightEndPoint = Offset(290.0, size.height - 5.0);
    path.quadraticBezierTo(eightControlPoint.dx, eightControlPoint.dy,
        eightEndPoint.dx, eightEndPoint.dy);

    var ninthControlPoint = Offset(310.0, size.height - 40.0);
    var ninthEndPoint = Offset(330.0, size.height - 5.0);
    path.quadraticBezierTo(ninthControlPoint.dx, ninthControlPoint.dy,
        ninthEndPoint.dx, ninthEndPoint.dy);

    path.lineTo(size.width, size.height - 10.0);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class OrangeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width - 250.0, size.height - 50.0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _WebviewState extends State<Webview> {
  final flutterWebViewPlugin = FlutterWebviewPlugin();
  String selectedUrl = 'http://ppid.unp.ac.id/';
  Widget body;
  @override
  void initState() {
    super.initState();
    cekkoneksi();
    flutterWebViewPlugin.close();
  }

  @override
  void dispose() {
    flutterWebViewPlugin.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      cekkoneksi();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: body,
    );
  }

  Widget nointernet() {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: OrangeClipper(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 250.0,
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
            ),
          ),
          ClipPath(
            clipper: BlackClipper(),
            child: Container(
              width: MediaQuery.of(context).size.width - 230.0,
              height: MediaQuery.of(context).size.height - 250.0,
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
          ),
          Center(
            child: Material(
              elevation: 30.0,
              color: Colors.white12,
              borderRadius: BorderRadius.circular(18.0),
              child: Container(
                width: 320.0,
                height: 330.0,
                decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(18.0)),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: ClipPath(
                  clipper: ZigZagClipper(),
                  child: Container(
                    width: 330.0,
                    height: 330.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18.0)),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(
                            width: 150.0,
                            height: 150.0,
                            child: Icon(
                              Icons.block,
                              color: Colors.red,
                              size: 135.0,
                            ),
                          ),
                        ),
                        Text(' No Internet ! ',
                            style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: InkWell(
                  splashColor: Colors.red,
                  onTap: () => _onBackPressed(),
                  child: Container(
                    width: 300.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        border:
                            Border.all(color: Colors.indigo[700], width: 1.5),
                        color: Colors.white),
                    child: Center(
                      child: Text(
                        'Exit App',
                        style: TextStyle(
                            color: Colors.indigo[700], fontSize: 15.0),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget webview() {
    return SafeArea(
        child: WebviewScaffold(
      url: selectedUrl,
      mediaPlaybackRequiresUserGesture: true,
      withZoom: true,
      withLocalStorage: true,
      withJavascript: true,
      initialChild: Container(
        color: Colors.white10,
        child: const Center(
          child: Text('Loading.....'),
        ),
      ),
    ));
  }

  Future<String> cekkoneksi() async {
    if (await Utils.checkConnection()) {
      setState(() => body = webview());
    } else {
      setState(() => body = nointernet());
      Toast.show("No Internet !! ", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    }
  }

  void _showDialogNoInternet() {
    // flutter defined function
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return WillPopScope(
            onWillPop: () => _onBackPressed(),
            child: AlertDialog(
              title: new Text("Tidak Ada Koneksi"),
              content: new Text("Silahkan Cek koneksi Anda"),
            ));
      },
    );
  }

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Are you sure?'),
              content: Text('Do you want to exit an App'),
              actions: <Widget>[
                FlatButton(
                  child: Text('No'),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                FlatButton(
                  child: Text('Yes'),
                  onPressed: () {
                    //Navigator.of(context).pop(true);
                    SystemNavigator.pop();
                  },
                )
              ],
            );
          },
        ) ??
        false;
  }
}
