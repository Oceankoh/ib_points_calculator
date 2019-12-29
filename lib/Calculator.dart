import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ib_points_calc/Globals.dart';
import 'package:ib_points_calc/Results.dart';

class Calculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  int points;
  String status;

  void calculate() {
    status = 'Getting latest Boundaries';
    getLatestBoundaries().then((result) {
      if (result) {
        //use latest values
      } else {
        setState(() => this.status = 'Failed to get boundaries');
        //use prev values
      }
      setState(() =>
          this.status = 'Using boundaries from: ' + Boundaries.year.toString());
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Results(points)));
    });
  }

  getLatestBoundaries() async {
    return true;
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
