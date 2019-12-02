import 'package:flutter/material.dart';
import 'data.dart';
import 'main.dart';

var dist = 1.5;
var KM = 'Km';

class SmallCards extends StatefulWidget {
  @override
  _SmallCardsState createState() => new _SmallCardsState();
}

class _SmallCardsState extends State<SmallCards> {
  List<String> hotspots = [
    "Bhaktapur Durbar Square",
    "Pilot Baba",
    "Changu Narayan",
    "Ghampe Dada",
  ];

  pressed() {
    bool newVal;
    if (isPressed) {
      newVal = false;
      remove = newVal;
    } else {
      newVal = true;
      remove = newVal;
    }
    setState(() {
      isPressed = newVal;
      remove = newVal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 230,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          padding: EdgeInsets.only(top: 20.0, left: 10.0),
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 160.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.5, 1.0),
                        blurRadius: 5.0,
                      )
                    ],
                    color: Colors.white,
                  ),
                  child: Column(
                    children: <Widget>[
                      Flexible(
                        child: Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0)),
                            child: Image(
                              image: AssetImage('assets/durbar-square.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        flex: 2,
                        fit: FlexFit.tight,
                      ),
                      Flexible(
                        child: Container(
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    hotspots[0],
                                    style: TextStyle(
                                      fontSize: 13.0,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(
                                      '$dist$KM away',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    IconButton(
                                      icon: new Icon(isPressed
                                          ? Icons.favorite
                                          : Icons.favorite_border),
                                      onPressed: () {
                                        pressed();
                                      },
                                      iconSize: 20.0,
                                      color: Colors.pink,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        flex: 1,
                        fit: FlexFit.loose,
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class SmallCardsView extends StatefulWidget {
  @override
  _SmallCardsViewState createState() => new _SmallCardsViewState();
}

class _SmallCardsViewState extends State<SmallCardsView> {
  List<String> hotspots = [
    "Bhaktapur Durbar Square",
    "Pilot Baba",
    "Changu Narayan",
    "Ghampe Dada",
  ];

  pressed() {
    bool newVal;
    // if (isPressed) {
    //   newVal = false;
    //   remove = newVal;
    // } else {
    //   newVal = true;
    //   remove = newVal;
    // }
    setState(() {
      isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 550,
      height: 415,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.only(top: 20.0, left: 10.0),
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 160.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.5, 1.0),
                        blurRadius: 5.0,
                      )
                    ],
                    color: Colors.white,
                  ),
                  child: Column(
                    children: <Widget>[
                      Flexible(
                        child: Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0)),
                            child: Image(
                              image: AssetImage('assets/durbar-square.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        flex: 2,
                        fit: FlexFit.tight,
                      ),
                      Flexible(
                        child: Container(
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    hotspots[0],
                                    style: TextStyle(
                                      fontSize: 13.0,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(
                                      '$dist$KM away',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    IconButton(
                                      icon: new Icon(isPressed
                                          ? Icons.favorite
                                          : Icons.favorite_border),
                                      onPressed: () {
                                        pressed();
                                      },
                                      iconSize: 20.0,
                                      color: Colors.pink,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        flex: 1,
                        fit: FlexFit.loose,
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
