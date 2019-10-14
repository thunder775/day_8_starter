import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:day_8_starter/Reusable_card.dart';
import 'package:day_8_starter/Round_button.dart';

import 'Result_Page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

const TextStyle kTextTextStyle = TextStyle(fontSize: 24, color: Colors.white30);
const TextStyle kNumberTextStyle =
    TextStyle(fontSize: 45, color: Colors.white, fontWeight: FontWeight.bold);
enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  int weight = 40;
  int age = 0;

  Gender gender;
  Color inactive = Color(0xFF111328);
  Color active = Color(0xFF1D1F31);
  Color activeText = Colors.white;
  Color inactiveText = Colors.white30;
  double height = 110;
  double bmi;

  void sliderFunction(double x) {
    setState(() {
      height = x;
    });
  }

  @override
  Widget build(BuildContext context) {
    bmi = weight / ((height * height) / 10000);

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: gender == Gender.male ? active : inactive,
                    tapCallback: () {
                      setState(() {
                        gender = Gender.male;
                      });
                      print('yo male');
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.mars,
                          size: 100,
                          color:
                              gender == Gender.male ? activeText : inactiveText,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'MALE',
                          style: TextStyle(
                              fontSize: 24,
                              color: gender == Gender.male
                                  ? activeText
                                  : inactiveText),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: gender == Gender.female ? active : inactive,
                    tapCallback: () {
                      setState(() {
                        gender = Gender.female;
                      });
                      print('yo female');
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 100,
                          color: gender == Gender.female
                              ? activeText
                              : inactiveText,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'FEMALE',
                          style: TextStyle(
                            fontSize: 24,
                            color: gender == Gender.female
                                ? activeText
                                : inactiveText,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: Center(
                          child: Text(
                        'HEIGHT',
                        style: TextStyle(fontSize: 24, color: inactiveText),
                      )),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            '${height.round()}',
                            style: TextStyle(
                                fontSize: 45,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'cm',
                            style: kTextTextStyle,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Colors.white30,
                          trackHeight: 3.0,
                          thumbColor: Color(0xFFD93559),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 12.0),
                          overlayColor: Colors.pinkAccent.withAlpha(32),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 24.0),
                        ),
                        child: Slider(
                          min: 110,
                          max: 250,
                          value: height,
                          onChanged: sliderFunction,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kTextTextStyle,
                        ),
                        Text(
                          '$weight',
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Roundbutton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            Roundbutton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: kTextTextStyle,
                      ),
                      Text(
                        '$age',
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Roundbutton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          Roundbutton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  )),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            child: FlatButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              bmi: bmi,
                            )));
              },
              child: Text(
                'Calculate Your BMI',
                style: TextStyle(fontSize: 18),
              ),
              color: Color(0xFFD93559),
            ),
          )
        ],
      ),
    );
  }
}
