import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:ib_points_calc/Globals.dart';
import 'package:ib_points_calc/Home.dart';
import 'package:ib_points_calc/device.dart' as dev;
import 'package:shared_preferences/shared_preferences.dart';

class SubjectSelect extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SubjectSelectState();
}

List<String> hlSubjects = [
  'Biology',
  'Business Mangement',
  'Chemistry',
  'Computer Science',
  'Economics',
  'Language and Literature',
  'Literature',
  'Geograhy',
  'History',
  'Mathematics',
  'Music',
  'Physics',
  'Visual Arts'
];

List<String> slSubjects = [
  'Biology',
  'Business Mangement',
  'Chemistry',
  'Chinese B',
  'Economics',
  'Language and Literature',
  'French ab',
  'Geography',
  'History',
  'Malay ab',
  'Malay B',
  'Mandarin ab',
  'Mathematics',
  'Music',
  'Physics',
  'Spanish ab',
  'Tamil B'
];

class SubjectSelectState extends State<SubjectSelect> {
  SimpleAutoCompleteTextField fieldHL1,
      fieldHL2,
      fieldHL3,
      fieldSL1,
      fieldSL2,
      fieldSL3;
  GlobalKey<AutoCompleteTextFieldState<String>> key1 = GlobalKey(),
      key2 = GlobalKey(),
      key3 = GlobalKey(),
      key4 = GlobalKey(),
      key5 = GlobalKey(),
      key6 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Subject Combination',
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: dev.screenHeight * 0.05),
                child: fieldHL1 = SimpleAutoCompleteTextField(
                  key: key1,
                  suggestions: hlSubjects,
                  decoration: InputDecoration(
                    hintStyle: Theme
                        .of(context)
                        .textTheme
                        .caption,
                    hintText: 'HL 1',
                    border: OutlineInputBorder(),
                  ),
                  clearOnSubmit: false,
                  textSubmitted: (text) {
                    fieldHL1.textField.controller.text = text;
                  },
                ),
                width: dev.screenWidth * 0.75,
              ),
              Container(
                padding: EdgeInsets.only(bottom: dev.screenHeight * 0.05),
                child: fieldHL2 = SimpleAutoCompleteTextField(
                  key: key2,
                  suggestions: hlSubjects,
                  decoration: InputDecoration(
                    hintStyle: Theme
                        .of(context)
                        .textTheme
                        .caption,
                    hintText: 'HL 2',
                    border: OutlineInputBorder(),
                  ),
                  clearOnSubmit: false,
                  textSubmitted: (text) {
                    fieldHL2.textField.controller.text = text;
                  },
                ),
                width: dev.screenWidth * 0.75,
              ),
              Container(
                padding: EdgeInsets.only(bottom: dev.screenHeight * 0.05),
                child: fieldHL3 = SimpleAutoCompleteTextField(
                  key: key3,
                  suggestions: hlSubjects,
                  decoration: InputDecoration(
                    hintStyle: Theme
                        .of(context)
                        .textTheme
                        .caption,
                    hintText: 'HL 3',
                    border: OutlineInputBorder(),
                  ),
                  clearOnSubmit: false,
                  textSubmitted: (text) {
                    fieldHL3.textField.controller.text = text;
                  },
                ),
                width: dev.screenWidth * 0.75,
              ),
              Container(
                padding: EdgeInsets.only(bottom: dev.screenHeight * 0.05),
                child: fieldSL1 = SimpleAutoCompleteTextField(
                  key: key4,
                  suggestions: slSubjects,
                  decoration: InputDecoration(
                    hintStyle: Theme
                        .of(context)
                        .textTheme
                        .caption,
                    hintText: 'SL 1',
                    border: OutlineInputBorder(),
                  ),
                  clearOnSubmit: false,
                  textSubmitted: (text) {
                    fieldSL1.textField.controller.text = text;
                  },
                ),
                width: dev.screenWidth * 0.75,
              ),
              Container(
                padding: EdgeInsets.only(bottom: dev.screenHeight * 0.05),
                child: fieldSL2 = SimpleAutoCompleteTextField(
                  key: key5,
                  suggestions: slSubjects,
                  decoration: InputDecoration(
                    hintStyle: Theme
                        .of(context)
                        .textTheme
                        .caption,
                    hintText: 'SL 2',
                    border: OutlineInputBorder(),
                  ),
                  clearOnSubmit: false,
                  textSubmitted: (text) {
                    fieldSL2.textField.controller.text = text;
                  },
                ),
                width: dev.screenWidth * 0.75,
              ),
              Container(
                padding: EdgeInsets.only(bottom: dev.screenHeight * 0.05),
                child: fieldSL3 = SimpleAutoCompleteTextField(
                  key: key6,
                  suggestions: slSubjects,
                  decoration: InputDecoration(
                    hintStyle: Theme
                        .of(context)
                        .textTheme
                        .caption,
                    hintText: 'SL 3',
                    border: OutlineInputBorder(),
                  ),
                  clearOnSubmit: false,
                  textSubmitted: (text) {
                    fieldSL3.textField.controller.text = text;
                  },
                ),
                width: dev.screenWidth * 0.75,
              ),
              MaterialButton(
                child: Text('Save', style: Theme.of(context).textTheme.button),
                onPressed: () {
                  //TODO ensure subject is in list not just empty
                  if (fieldHL1.textField.controller.text != '' &&
                      fieldHL2.textField.controller.text != '' &&
                      fieldHL3.textField.controller.text != '' &&
                      fieldSL1.textField.controller.text != '' &&
                      fieldSL2.textField.controller.text != '' &&
                      fieldSL3.textField.controller.text != '') {
                    saveSubjects().then((result) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    });
                  }
                },
                minWidth: dev.screenWidth * 0.75,
                height: dev.screenHeight * 0.075,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }

  saveSubjects() async {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString('HL1', fieldHL1.textField.controller.text);
      prefs.setString('HL2', fieldHL2.textField.controller.text);
      prefs.setString('HL3', fieldHL3.textField.controller.text);
      prefs.setString('SL1', fieldSL1.textField.controller.text);
      prefs.setString('SL2', fieldSL2.textField.controller.text);
      prefs.setString('SL3', fieldSL3.textField.controller.text);
    });
    SubjectCombination.HL1 = fieldHL1.textField.controller.text;
    SubjectCombination.HL2 = fieldHL2.textField.controller.text;
    SubjectCombination.HL3 = fieldHL3.textField.controller.text;
    SubjectCombination.SL1 = fieldSL1.textField.controller.text;
    SubjectCombination.SL2 = fieldSL2.textField.controller.text;
    SubjectCombination.SL3 = fieldSL3.textField.controller.text;
    return true;
  }
}
