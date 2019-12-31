import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ib_points_calc/Home.dart';
import 'package:ib_points_calc/device.dart' as dev;

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
              Widget>[
        Container(
          height: dev.screenHeight * 0.2,
        ),
        Text('Something went wrong', style: Theme.of(context).textTheme.title),
        Padding(
          padding: EdgeInsets.fromLTRB(30, 30, 30, 100),
          child: Text(
            'Please check that you have entered valid subjects. If error still persists, please contact the developer',
            style: Theme.of(context).textTheme.caption,
            textAlign: TextAlign.center,
          ),
        ),
        MaterialButton(
          child: Text(
            'Return',
            style: Theme.of(context).textTheme.button,
          ),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        )
      ])),
    );
  }
}
