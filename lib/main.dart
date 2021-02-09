import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(title: "Contador de pessoas", home: Home())); //Material App
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  int _people = 0;
  String _message = "Pode entrar!";

  void _changePeople(int delta) {
    setState(() {
      _people += delta;
      if (_people >= 20) {
        _message = "Lotado, não pode entrar.";
        _people = 20;
      } else if (_people < 20 && _people >= 0) {
        _message = "Pode entrar!";
      } else {
        _people = 0;
      }
    });
  }

  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                color: Colors.white,
                width: double.infinity,
                height: 48.0,
                child: Text(
                  "PESSOAS: $_people",
                  style: TextStyle(
                      color: Colors.blue[300], fontWeight: FontWeight.bold),
                ),
              ),
            ), //text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "+1",
                          style: TextStyle(fontSize: 40.0, color: Colors.white),
                        )),
                    onPressed: () {
                      _changePeople(1);
                    },
                    style: ElevatedButton.styleFrom(shape: CircleBorder()),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "-1",
                          style: TextStyle(fontSize: 40.0, color: Colors.white),
                        )),
                    onPressed: () {
                      _changePeople(-1);
                    },
                    style: ElevatedButton.styleFrom(shape: CircleBorder()),
                  ),
                ),
              ],
            ),
            Center(
              child: Container(
                color: Colors.white,
                width: double.infinity,
                height: 96.0,
                child: Text(
                  _message,
                  style: TextStyle(
                      color: Colors.blue[400],
                      fontStyle: FontStyle.italic,
                      fontSize: 30),
                ),
              ),
            ),
            //text
          ], //widget
        ) //Column
      ],
    );
  }
}
