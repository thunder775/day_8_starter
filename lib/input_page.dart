import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  Gender gender;
  Color inactive = Color(0xFF111328);
  Color active = Color(0xFF1D1F31);
  Color activeText = Colors.white;
  Color inactiveText = Colors.white30;
  double current = 110;

  void sliderFunction(double x) {
    setState(() {
      current = x;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    Center(
                        child: Text(
                      'HEIGHT',
                      style: TextStyle(color: Colors.white70, fontSize: 24),
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          '${current.round()}',
                          style: TextStyle(
                              fontSize: 45,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'cm',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white70,
                          ),
                        )
                      ],
                    ),
                    Slider(
                      activeColor: Colors.white,
                      inactiveColor: Colors.white30,
                      min: 110,
                      max: 250,
                      value: current,
                      onChanged: sliderFunction,

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
                  child: ReusableCard(),
                ),
                Expanded(
                  child: ReusableCard(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function tapCallback;

  ReusableCard(
      {this.color = const Color(0xFF1D1F31), this.child, this.tapCallback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapCallback,
      child: Container(
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: child,
      ),
    );
  }
}
