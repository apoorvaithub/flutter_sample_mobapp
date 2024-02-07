import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        // ignore: unnecessary_const
        body: HomeScreen(ttt: 53),
        // body: Center(
        //   child: Text('Hello World!'),
        // ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final int ttt;
  const HomeScreen({Key? key, required this.ttt}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  int ttt = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ttt = widget.ttt;
    print("tttttt isssss  $ttt");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ttitle Tesing"),
        shadowColor: Colors.greenAccent,
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
                onPressed: () {
                  print("text button clicked");

                  Navigator.of(context)
                      .push(MaterialPageRoute<bool>(
                          builder: (BuildContext context) => NextScreen()))
                      .then((bool value) {} as FutureOr Function(bool? value));
                },
                child: const Text("TextButton",
                    style: TextStyle(color: Colors.black, fontSize: 18))),
            ElevatedButton(
                onPressed: () {
                  print("ElevatedButton clicked");
                  Navigator.of(context).push(MaterialPageRoute<bool>(
                      builder: (BuildContext context) => NextScreen()));
                  /*
 Navigator.of(context)
        .push(new MaterialPageRoute<bool>(builder: (BuildContext context) => new WLStepsScreen(companyName: company_name,workout: workout,appState: appState,workouts: this.workouts,)))
        .then((bool value) {
      if(value != null && value){
        getWorkouts();
      }
    });
                  */
                },
                child: const Text("ElevatedButton",
                    style: TextStyle(color: Colors.black, fontSize: 18)))
          ],
        ),
      ),
    );
  }
}

class NextScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NextState();
}

class _NextState extends State<NextScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("title"),
      ),
    );
  }
}
