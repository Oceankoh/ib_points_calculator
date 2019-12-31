import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ib_points_calc/Globals.dart';
import 'package:ib_points_calc/Results.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Calculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  int points = 0,
      year;
  String status;

  void calculate() {
    status = 'Getting latest Boundaries';
    getLatestBoundaries().then((data) {
      Map<String, dynamic> result = data.data;
      if (result != null) {
        this.year = result['year'];
      } else {
        SharedPreferences.getInstance().then((prefs) {
          result = prefs.get('boundaries');
          this.year = result['year'];
        });
      }
      setState(() => this.status = 'Using boundaries from: ' + year.toString());
      print('here');
      points += calculatePoints(result['ranges']['HL' + SubjectCombination.HL1],
          SubjectCombination.hl1Score);
      points += calculatePoints(result['ranges']['HL' + SubjectCombination.HL2],
          SubjectCombination.hl2Score);
      points += calculatePoints(result['ranges']['HL' + SubjectCombination.HL3],
          SubjectCombination.hl3Score);
      points += calculatePoints(result['ranges']['HL' + SubjectCombination.SL1],
          SubjectCombination.sl1Score);
      points += calculatePoints(result['ranges']['HL' + SubjectCombination.SL2],
          SubjectCombination.sl2Score);
      points += calculatePoints(result['ranges']['HL' + SubjectCombination.SL3],
          SubjectCombination.sl3Score);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => Results(points, year)));
    });
  }

  getLatestBoundaries() async {
    return Firestore.instance
        .collection("boundaries")
        .document("document")
        .get();
  }

  calculatePoints(Map<dynamic, dynamic> ranges, double score) {
    score = score.round().toDouble();
    int grade = 0;
    if (score > ranges['6']) {
      grade = 7;
    } else if (score > ranges['5']) {
      grade = 6;
    } else if (score > ranges['4']) {
      grade = 5;
    } else if (score > ranges['3']) {
      grade = 4;
    } else if (score > ranges['2']) {
      grade = 3;
    } else if (score > ranges['1']) {
      grade = 2;
    } else {
      grade = 1;
    }
    return grade;
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
            style: Theme
                .of(context)
                .textTheme
                .headline,
          ),
        ));
  }
}
