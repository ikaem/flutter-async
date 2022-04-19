import "dart:async";
// following needed for future group
import "package:async/async.dart";
import "package:flutter/material.dart";
import 'package:google_books_2/geolocation.dart';
import 'package:google_books_2/navigation_dialog.dart';
import 'package:google_books_2/navigation_first.dart';
// this has to be here in any case
import 'package:http/http.dart';
/* this part if we need to use it named */
import 'package:http/http.dart' as http;
// http.get(...)

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Future Demo",
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // home: FuturePage(),
        // home: LocationScreen());
        // home: NavigationFirst());
        home: NavigationDialog());
  }
}

class FuturePage extends StatefulWidget {
  @override
  _FuturePageState createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = "";
  late Completer<int> completer;

  Future<int> getNumber() {
    completer = Completer<int>();
    // this will assign value to the future eventually
    calculate();
    // this will jsut reach syncnornously and will aways return this
    return completer.future;
  }

  // this ufnction will assign - resolve or reject the future
  calculate() async {
    // this is just to simulate some api request
    await new Future.delayed(const Duration(seconds: 5));
    completer.complete(42);
  }

  @override
  Widget build(BuildContext context) {
    print("result: $result");

    return Scaffold(
        appBar: AppBar(
          title: Text("Back from the future"),
        ),
        body: Center(
          child: Column(children: <Widget>[
            Spacer(),
            ElevatedButton(
                onPressed: () async {
                  try {
                    final data = await returnError();
                    setState(() {
                      result = data;
                    });
                  } catch (error) {
                    setState(() {
                      result = error.toString();
                    });
                  } finally {
                    print("Complete");
                  }
                },
                // onPressed: () {
                //   print("jhere");
                //   returnError().then((data) {
                //     setState(() {
                //       result = data;
                //     });
                //   }).catchError((error) {
                //     print("this is error: $error");
                //     setState(() {
                //       result = error.toString();
                //       // result = error;
                //     });
                //   }).whenComplete(() => print("Complete"));
                // },

                // onPressed: () {
                //   returnError().then((value) {
                //     setState(() {
                //       result = 'Success';
                //     });
                //   }).catchError((onError) {
                //     setState(() {
                //       result = onError;
                //     });
                //   }).whenComplete(() => print('Complete'));
// handling errors
                // returnError().then((value) {
                //   setState(() {
                //     result = "Success";
                //   });
                // }).catchError((onError) {
                //   setState(() {
                //     result = onError;
                //   });
                // }).whenComplete(() => print("Complete"));

                // returnFG();
                // getNumber().then((value) {
                //   setState(() {
                //     result = value.toString();
                //   });
                // });
                // count();
                // getData().then((value) {
                //   print(value);
                //   setState(() {
                //     result = value.body.toString().substring(0, 450);
                //   });
                // }).catchError((_) {
                //   setState(() {
                //     result = "An error occured";
                //   });
                // });
                // },
                child: Text("Go")),
            Spacer(),
            Text(result.toString()),
            Spacer(),
            CircularProgressIndicator(),
            Spacer()
          ]),
        ));
  }

// see how async is defiend
  Future<Response> getData() async {
    const String authority = "www.googleapis.com";
    const String path = "/books/v1/volumes/junbDwAAQBAJ";
    Uri url = Uri.https(authority, path);

    return http.get(url);
  }

  Future<int> returnOneAsync() async {
    await Future.delayed(const Duration(seconds: 3));

    return 1;
  }

  Future<int> returnTwoAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 2;
  }

  Future<int> returnThreeAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 3;
  }

  Future count() async {
    int total = 0;
    total = await returnOneAsync();
    total += await returnTwoAsync();
    total += await returnThreeAsync();

    setState(() {
      result = total.toString();
    });
  }

  void returnFG() {
    FutureGroup<int> futureGroup = FutureGroup<int>();

    // now we add stuff
    futureGroup.add(returnOneAsync());
    futureGroup.add(returnThreeAsync());
    futureGroup.add(returnThreeAsync());
    futureGroup.close();

// the future field is the future that fires once close has been called and all futures have completed
    futureGroup.future.then((List<int> value) {
      int total = 0;
      value.forEach((element) {
        total += element;
      });
      setState(() {
        result = total.toString();
      });
    });
  }

  Future returnError() {
    // return Future.error("Something terrible happened");
    // throw Exception("Something terrible happened");

    // Future.error(throw ("Something terrible happened"));
    // Future.err

    throw ("Somwething terrible happened");
  }
}
