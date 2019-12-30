import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ib_points_calc/Results.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Calculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  int points, year;
  String status;

  void calculate() {
    status = 'Getting latest Boundaries';
    getLatestBoundaries().then((result) {
      if (result != null) {
        //use latest values
      } else {
        setState(() => this.status = 'Failed to get boundaries');
        //use prev values
      }
      setState(() => this.status = 'Using boundaries from: ' + year.toString());
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => Results(points, year)));
    });
  }

  getLatestBoundaries() async {
    String jsonBoundaries;
    Firestore.instance
        .collection("boundaries")
        .document("document")
        .get()
        .then((documentSnapshot) {
      jsonBoundaries = documentSnapshot.toString();
      debugPrint(jsonBoundaries);
    });

    SharedPreferences.getInstance().then((prefs) {
      prefs.setString('boundaries', jsonBoundaries);
    });
    return jsonBoundaries;
  }

  @override
  void initState() {
    super.initState();
    calculate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text(
            status,
            style: Theme.of(context).textTheme.headline,
          ),
        ));
  }
}
