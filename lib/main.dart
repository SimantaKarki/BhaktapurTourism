import 'package:bhaktapur_tourism/AppHome.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:transparent_image/transparent_image.dart';
import 'hDesign.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'MappingUser.dart';
import 'hosts.dart';
import 'hDesign.dart';
import 'flutterUpload.dart';
import 'Authentication.dart';
import 'package:bhaktapur_tourism/allHotspots.dart';
import 'smallCards.dart';

void main() {
  var themeData = ThemeData(
      primaryColor: Colors.red, accentColor: Colors.red[800].withOpacity(0.8));
  runApp(
    MaterialApp(
      theme: themeData,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  );
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () => runApp(MaterialApp(
        home: MappingPage(
          auth: Auth(),
        ),
        debugShowCheckedModeBanner: false,
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [
                    0.13,
                    0.4,
                    0.8,
                    0.9
                  ],
                  colors: [
                    Colors.red[600].withOpacity(0.9),
                    Colors.red[800],
                    Colors.red[900],
                    Colors.red[900]
                  ]),
            ),
            child: Opacity(
              opacity: 0.25,
              child: Image(
                image: AssetImage('assets/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: ImageIcon(
                          AssetImage(
                            'assets/logoWhite.png',
                          ),
                          color: Colors.white,
                          size: 65.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 100.0),
                    ),
                    Text("Explore and \n have Fun",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                        )),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                    ),
                    LinearProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  MyApp({
    this.auth,
    this.onSignedOut,
  });
  final AuthImplementation auth;
  final VoidCallback onSignedOut;

  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Posts> postList = [];

  @override
  void initState() {
    super.initState();
    DatabaseReference postsRef =
        FirebaseDatabase.instance.reference().child("Posts");

    postsRef.once().then((DataSnapshot snap) {
      var KEYS = snap.value.keys;
      var DATA = snap.value;

      postList.clear();

      for (var individualKey in KEYS) {
        Posts posts = new Posts(
          DATA[individualKey]['image'],
          DATA[individualKey]['description'],
          DATA[individualKey]['date'],
          DATA[individualKey]['time'],
        );
        postList.add(posts);
      }
      setState(() {
        print("Length : $postList.length");
      });
    });
  }

  void _logoutUser() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      Dialog errorDialog = Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Container(
          width: 300,
          child: Wrap(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(
                          left: 30.0, right: 30.0, top: 10.0, bottom: 5.0),
                      child: Text(
                        "Error!",
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.red[900],
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                          top: 10.0, left: 30.0, right: 30.0, bottom: 15.0),
                      child: Text(
                        "${e.toString()}",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      );
      showDialog(
          context: context, builder: (BuildContext context) => errorDialog);
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoubleBackToCloseApp(
        snackBar: SnackBar(
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Back Again to Exit",
              style: TextStyle(
                color: Colors.redAccent,
              ),
            ),
          ),
          backgroundColor: Colors.white,
        ),
        child: AppHome(),
      ),
    );
  }
}
