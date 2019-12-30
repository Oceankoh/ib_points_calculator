import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ib_points_calc/Globals.dart';
import 'package:ib_points_calc/SubjectSelector.dart';
import 'package:ib_points_calc/device.dart' as dev;

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<HomePage> {
  TextEditingController hl1 = TextEditingController(),
      hl2 = TextEditingController(),
      hl3 = TextEditingController(),
      sl1 = TextEditingController(),
      sl2 = TextEditingController(),
      sl3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Scores',
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(dev.screenWidth * 0.05, 0,
                    dev.screenWidth * 0.05, dev.screenHeight * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(SubjectCombination.HL1,
                        style: Theme.of(context).textTheme.body1),
                    Container(
                      width: dev.screenWidth * 0.2,
                      height: dev.screenHeight * 0.05,
                      child: TextField(
                        controller: hl1,
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        style: Theme.of(context).textTheme.body1,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(dev.screenWidth * 0.05, 0,
                    dev.screenWidth * 0.05, dev.screenHeight * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(SubjectCombination.HL2,
                        style: Theme.of(context).textTheme.body1),
                    Container(
                      width: dev.screenWidth * 0.2,
                      height: dev.screenHeight * 0.05,
                      child: TextField(
                        controller: hl2,
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        style: Theme.of(context).textTheme.body1,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(dev.screenWidth * 0.05, 0,
                    dev.screenWidth * 0.05, dev.screenHeight * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(SubjectCombination.HL3,
                        style: Theme.of(context).textTheme.body1),
                    Container(
                      width: dev.screenWidth * 0.2,
                      height: dev.screenHeight * 0.05,
                      child: TextField(
                        controller: hl3,
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        style: Theme.of(context).textTheme.body1,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(dev.screenWidth * 0.05, 0,
                    dev.screenWidth * 0.05, dev.screenHeight * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(SubjectCombination.SL1,
                        style: Theme.of(context).textTheme.body1),
                    Container(
                      width: dev.screenWidth * 0.2,
                      height: dev.screenHeight * 0.05,
                      child: TextField(
                        controller: sl1,
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        style: Theme.of(context).textTheme.body1,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(dev.screenWidth * 0.05, 0,
                    dev.screenWidth * 0.05, dev.screenHeight * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(SubjectCombination.SL2,
                        style: Theme.of(context).textTheme.body1),
                    Container(
                      width: dev.screenWidth * 0.2,
                      height: dev.screenHeight * 0.05,
                      child: TextField(
                        controller: sl2,
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        style: Theme.of(context).textTheme.body1,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(dev.screenWidth * 0.05, 0,
                    dev.screenWidth * 0.05, dev.screenHeight * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(SubjectCombination.SL3,
                        style: Theme.of(context).textTheme.body1),
                    Container(
                      width: dev.screenWidth * 0.2,
                      height: dev.screenHeight * 0.05,
                      child: TextField(
                        controller: sl3,
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        style: Theme.of(context).textTheme.body1,
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  MaterialButton(
                    child: Text('Modify Subjects',
                        style: Theme
                            .of(context)
                            .textTheme
                            .button),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SubjectSelect()));
                    },
                    minWidth: dev.screenWidth * 0.4,
                    height: dev.screenHeight * 0.075,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  MaterialButton(
                    child: Text('Calculate',
                        style: Theme
                            .of(context)
                            .textTheme
                            .button),
                    onPressed: () {
                      //TODO ensure input is a number
                      if (hl1.text != '' &&
                          hl2.text != '' &&
                          hl3.text != '' &&
                          sl1.text != '' &&
                          sl2.text != '' &&
                          sl3.text != '') {
                        SubjectCombination.hl1Score = double.parse(hl1.text);
                        SubjectCombination.hl2Score = double.parse(hl2.text);
                        SubjectCombination.hl3Score = double.parse(hl3.text);
                        SubjectCombination.sl1Score = double.parse(sl1.text);
                        SubjectCombination.sl2Score = double.parse(sl2.text);
                        SubjectCombination.sl3Score = double.parse(sl3.text);
                      }
                    },
                    minWidth: dev.screenWidth * 0.4,
                    height: dev.screenHeight * 0.075,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              )
            ],
          ),
        ),
      ),
    );
  }
}
