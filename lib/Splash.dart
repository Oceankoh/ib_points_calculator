import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:ib_points_calc/Globals.dart';
import 'package:ib_points_calc/SubjectSelector.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:ib_points_calc/Home.dart';
import 'package:ib_points_calc/device.dart' as dev;

//import 'package:animator/animator.dart';
//import 'dart:math';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashState();
}

class SplashState extends State<Splash> {
  initSharedPreferences() async {
    SharedPreferences.getInstance().then((prefs) {
      SubjectCombination.HL1 = prefs.getString('HL1');
      SubjectCombination.HL2 = prefs.getString('HL2');
      SubjectCombination.HL3 = prefs.getString('HL3');
      SubjectCombination.SL1 = prefs.getString('SL1');
      SubjectCombination.SL2 = prefs.getString('SL2');
      SubjectCombination.SL3 = prefs.getString('SL3');
    });
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    initSharedPreferences();
    Future.delayed(Duration(seconds: 3), () {
      if (SubjectCombination.HL1 == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SubjectSelect()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        body: Center(key: UniqueKey(), child: LoadAnimation()));
  }
}

class LoadAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    dev.screenHeight = MediaQuery.of(context).size.height;
    dev.screenWidth = MediaQuery.of(context).size.width;
    return Container(
        child: Center(
            child: Column(children: [
//      Container(
//          child: Animator(
//              tween: Tween<double>(begin: 0, end: 2 * pi),
//              duration: Duration(seconds: 2),
//              repeats: 0,
//              curve: Curves.easeInOutQuart,
//              builder: (anim) => Transform.rotate(
//                  angle: anim.value,
//                  child: Container(
//                    decoration: BoxDecoration(
//                      image: DecorationImage(
//                          image: AssetImage('assets/MazeCircle.png')),
//                      shape: BoxShape.circle,
//                    ),
//                    width: dev.screenWidth * 0.2,
//                    height: dev.screenHeight * 0.2,
//                  )))),
      Text(
        'LOADING',
        style: TextStyle(fontSize: 40, color: Theme.of(context).primaryColor),
      ),
    ], mainAxisAlignment: MainAxisAlignment.center)));
  }
}
