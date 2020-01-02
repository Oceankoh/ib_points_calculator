import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ib_points_calc/Globals.dart';
import 'package:ib_points_calc/device.dart' as dev;
import 'package:ib_points_calc/Home.dart';

// ignore: must_be_immutable
class Results extends StatefulWidget {
  int points, year;

  Results(int ibPoints, boundaryYear) {
    this.points = ibPoints;
    this.year = boundaryYear;
  }

  @override
  State<StatefulWidget> createState() => ResultsState(points, year);
}

class ResultsState extends State<Results> {
  int points, year;

  @override
  void initState() {
    super.initState();
    AppAds.ads.showFullScreenAd();
  }

  ResultsState(int ibPoints, boundaryYear) {
    this.points = ibPoints;
    this.year = boundaryYear;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Results',
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Boundaries from: ' + year.toString(),
              style: Theme
                  .of(context)
                  .textTheme
                  .subhead,
            ),
            Text(
              'Points: ' + points.toString(),
              style: Theme
                  .of(context)
                  .textTheme
                  .subhead,
            ),
            MaterialButton(
              child: Text('Return Home',
                  style: Theme.of(context).textTheme.button),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              minWidth: dev.screenWidth * 0.75,
              height: dev.screenHeight * 0.075,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            )
          ],
        ),
      ),
    );
  }
}
