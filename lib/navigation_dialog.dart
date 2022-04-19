import 'package:flutter/material.dart';

class NavigationDialog extends StatefulWidget {
  const NavigationDialog({Key? key}) : super(key: key);

  @override
  State<NavigationDialog> createState() => _NavigationDialogState();
}

class _NavigationDialogState extends State<NavigationDialog> {
  Color color = Colors.blue.shade700;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(title: Text("Navigation Dialog Screen")),
      body: Center(
          child: ElevatedButton(
        child: Text("Change colorr"),
        onPressed: () {
          _showColorDialog(context);
          // _showColorDialog(context).then((color) {
          //   print("This is color: $color");
          //   // setState(() {
          //   //   color = color;
          //   // });
          // });
        },
      )),
    );
  }

  void _showColorDialog(BuildContext context) async {
    Color initialColor = Colors.blue.shade700;

    Color poppedColor = await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return AlertDialog(
              title: Text("Very important question"),
              content: Text("Please choose a color"),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      initialColor = Color(0xFFD32F2F);
                      Navigator.pop(context, initialColor);
                    },
                    child: Text("Red")),
                TextButton(
                    onPressed: () {
                      initialColor = Colors.blue.shade700;
                      Navigator.pop(context, initialColor);
                    },
                    child: Text("Blue")),
                TextButton(
                    onPressed: () {
                      initialColor = Colors.yellow.shade700;
                      Navigator.pop(context, initialColor);
                    },
                    child: Text("Yellow"))
              ]);
        });

    print("this is data: $poppedColor");

    setState(() {
      color = poppedColor;
    });
    // return poppedColor;
  }
}
