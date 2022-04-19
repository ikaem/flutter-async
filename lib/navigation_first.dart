import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'navigation_second.dart';

class NavigationFirst extends StatefulWidget {
  @override
  _NavigationFirstState createState() => _NavigationFirstState();
}

class _NavigationFirstState extends State<NavigationFirst> {
  Color color = Colors.blue.shade700;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: color,
        appBar: AppBar(
          title: Text("Change color"),
        ),
        body: Center(
          child: ElevatedButton(
            child: Text("Change color"),
            onPressed: () {
              _navigateAndGetColor(context);
            },
          ),
        ));
  }

  _navigateAndGetColor(BuildContext context) async {
    Color newColor = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NavigationSecond()),
    );

    setState(() {
      color = newColor;
    });
  }
}
