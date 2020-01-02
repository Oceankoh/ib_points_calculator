import 'dart:io';
import 'package:ads/ads.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:ib_points_calc/Globals.dart';
import 'package:ib_points_calc/SubjectSelector.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:ib_points_calc/Home.dart';
import 'package:ib_points_calc/device.dart' as dev;

import 'package:animator/animator.dart';
import 'dart:math';

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

  initAds() {
    final String appId = Platform.isAndroid
    //TODO replace with legit app id and interstitial id
        ? 'ca-app-pub-9334071002974261~2869280074'
        : 'ca-app-pub-9334071002974261~4992880538';
    final String interstitialId = Platform.isAndroid
        ? 'ca-app-pub-9334071002974261/2294565008'
        : 'ca-app-pub-9334071002974261/3679798861';
    AppAds.ads = Ads(appId);

    /// Assign the listener.
    var eventListener = (MobileAdEvent event) {
      if (event == MobileAdEvent.closed) {
        print("User has opened and now closed the ad.");
      }
    };

    AppAds.ads.setFullScreenAd(
        adUnitId: interstitialId,
        listener: eventListener);
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    initSharedPreferences();
    Future.delayed(Duration(seconds: 3), () {
      initAds();
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
              Container(
                child: Animator(
                  tween: Tween<double>(begin: 0, end: 2 * pi),
                  duration: Duration(seconds: 2),
                  repeats: 0,
                  curve: Curves.easeInOutQuart,
                  builder: (anim) =>
                      Transform.rotate(
                        angle: anim.value,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Icon(Icons.sync, size: 50),
                        ),
                      ),
                ),
              ),
              Text(
                'Loading',
                style: TextStyle(fontSize: 30, color: Theme
                    .of(context)
                    .primaryColor),
              ),
            ], mainAxisAlignment: MainAxisAlignment.center)));
  }
}
