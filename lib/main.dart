import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "People Count App",
      home: Scaffold(body: Home())));
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _peopleCount = 0;
  String _infoText = "Come in!";

  void changePeople(int delta) {
    setState(() {
      _peopleCount += delta;

      if (_peopleCount > 10) {
        _infoText = "Sorry... We're Crowded :(";
        _peopleCount--;
      } else if (_peopleCount < 0) {
        _infoText = "Are you in a inverted world?";
        _peopleCount++;
      } else {
        _infoText = "Come in!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'images/restaurant.jpg',
          fit: BoxFit.cover,
          height: 2000,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellow, width: 5.0)),
                child: Stack(
                  children: <Widget>[
                    Text(
                      "People: $_peopleCount",
                      style: TextStyle(
                        fontSize: 62.0,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 6
                          ..color = Colors.grey[600],
                      ),
                    ),
                    Text(
                      "People: $_peopleCount",
                      style: TextStyle(
                        fontSize: 62.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: RaisedButton(
                      color: Colors.yellow,
                      child: Text(
                        "+1",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        changePeople(1);
                      },
                    )),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: RaisedButton(
                      color: Colors.yellow,
                      child: Text(
                        "-1",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        changePeople(-1);
                      },
                    )),
              ],
            ),
            Stack(children: <Widget>[
              Text(
                _infoText,
                style: TextStyle(
                  fontSize: 30.0,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 6
                    ..color = Colors.grey[800],
                ),
              ),
              Text(
                _infoText,
                style: TextStyle(color: Colors.white, fontSize: 30.0),
              )
            ]),
          ],
        ),
      ],
    );
  }
}
