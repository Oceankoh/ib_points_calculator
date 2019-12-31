import 'package:flutter/material.dart';
import 'package:ib_points_calc/Splash.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
        textTheme: TextTheme(
          title: TextStyle(fontSize: 25),
          subhead: TextStyle(fontSize: 20),
          caption: TextStyle(fontSize: 17,),
          body1: TextStyle(fontSize: 15),
          button: TextStyle(fontSize: 17),
        ),
      ),
      home: Splash(),
    );
  }
}
