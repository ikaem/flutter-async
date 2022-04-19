import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {
  @override
  _NavigationSecondState createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  @override
  Widget build(BuildContext context) {
    Color poppedColor;

    return Scaffold(
        appBar: AppBar(
          title: Text("Navigation Second Screen"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  poppedColor = Colors.red.shade700;
                  // so we can return whatever we want from the removed route
                  Navigator.pop(context, poppedColor);
                },
                child: Text("Red")),
            ElevatedButton(
                onPressed: () {
                  poppedColor = Colors.blue.shade700;
                  // so we can return whatever we want from the removed route
                  Navigator.pop(context, poppedColor);
                },
                child: Text("Blue")),
            ElevatedButton(
                onPressed: () {
                  poppedColor = Colors.yellow.shade700;
                  // so we can return whatever we want from the removed route
                  Navigator.pop(context, poppedColor);
                },
                child: Text("Yellow"))
          ],
        )));
  }
}
