import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class places extends StatefulWidget {
  @override
  _placesState createState() => new _placesState();
}

class _placesState extends State<places> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        body: Carousel(
          boxFit: BoxFit.cover,
          images: [
            AssetImage('assets/natapol.png'),
            AssetImage('assets/durbar-square.jpg'),
            AssetImage('assets/pilot-baba.jpg'),
            AssetImage('assets/siddha-pokhari.jpg'),
          ],
          animationCurve: Curves.fastLinearToSlowEaseIn,
          animationDuration: Duration(milliseconds: 4000),
          dotColor: Colors.redAccent[200],
          dotSpacing: 35.0,
          dotBgColor: Colors.transparent.withOpacity(0.15),
        ),
      ),
    );
  }
}

class durbar_square extends StatefulWidget {
  @override
  _durbar_squareState createState() => new _durbar_squareState();
}

class _durbar_squareState extends State<durbar_square> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
                height: 300,
                child: Carousel(
                  boxFit: BoxFit.cover,
                  images: [
                    AssetImage('assets/natapol.png'),
                    AssetImage('assets/durbar-square.jpg'),
                    AssetImage('assets/pilot-baba.jpg'),
                    AssetImage('assets/siddha-pokhari.jpg'),
                  ],
                  animationCurve: Curves.fastLinearToSlowEaseIn,
                  animationDuration: Duration(milliseconds: 4000),
                  dotColor: Colors.redAccent[200],
                  dotSpacing: 35.0,
                  dotBgColor: Colors.transparent.withOpacity(0.15),
                )),
            Container(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 15.0, left: 15.0, bottom: 20.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("Bhaktapur Durbar Square",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 15.0,
                                fontFamily: "Futura Heavy",
//                          fontWeight:FontWeight.w100,
                                letterSpacing: 0.5,
                              )),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Wrap(direction: Axis.vertical, children: <Widget>[
                          Text(
                              "Bhaktapur Durbar Square is the royal palace of the old Bhaktapur Kingdom, 1400 meters above sea level. It is a UNESCO World Heritage Site. The Bhaktapur Durbar Square is the located in the current town of BHaktapur.",
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 13.0,
                                fontFamily: "Futura Light",
//                          fontWeight:FontWeight.w100,
                                letterSpacing: 0.5,
                              )),
                        ]),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
