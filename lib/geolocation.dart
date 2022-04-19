import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String myPosition = "";

  @override
  void initState() {
    // print("what is up");

    // // getPosition().then((int number) {
    // //   print("number: $number");
    // // });

    // getPosition().then((Position myPos) {
    //   print("mypos: $myPos");
    //   myPosition =
    //       "Latitude: ${myPos.latitude.toString()} - Longitude: ${myPos.longitude.toString()}";

    //   setState(() {
    //     myPosition = myPosition;
    //   });
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Current Location")),
        // body: Center(child: Text(myPosition)),
        body: Center(
            child: FutureBuilder(
                // this is i guess data that will resolve eventually
                future: getPosition(),
                builder: (BuildContext context,
                    // snapshot is i guess current staste of the futrure
                    AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) print("Do something");

                    // snašpsjot data is i guess data
                    return Text(snapshot.data);
                  }

                  return Text("");
                })));
  }

  // Future<Position> getPosition() async {
  Future<String> getPosition() async {
    await Future<int?>.delayed(const Duration(seconds: 3));

    Position position =
        await Geolocator.getCurrentPosition(forceAndroidLocationManager: true);

    print("position: $position");

    // return position;
    return "Latitude: ${position.latitude.toString()} - Longitude: ${position.longitude.toString()}";

    // await Geolocator()
    // Position? position = await GeolocatorPlatform.instance
    //     // .getLastKnownPosition(desiredAccuracy: LocationAccuracy.high);
    //     .getLastKnownPosition();

    // print("position: $position");

    // return position;

    // GeolocatorPlatform.instance
    //     .getLastKnownPosition()
    //     .then((value) => print("value: $value"));

    //   print("is this started");
    //   LocationPermission permission = await Geolocator.checkPermission();

    //   bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    //   print("is this permsisson: $permission");
    //   print("is this enabled: $isServiceEnabled");

    //   GeolocatorPlatform.instance.getCurrentPosition().then((data) {
    //     print("data: $data");
    //   });

    //   try {
    //     // Position position = await Geolocator.getCurrentPosition(
    //     //     desiredAccuracy: LocationAccuracy.high);

    //     print("position:");

    //     // return position;
    //     return 3;
    //   } catch (error) {
    //     print("this is error: $error");
    //     throw Exception("This is error");
    //   }
  }
}
