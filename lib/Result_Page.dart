import 'package:day_8_starter/input_page.dart';
import 'package:flutter/material.dart';
import 'package:day_8_starter/Reusable_card.dart';

class ResultPage extends StatelessWidget {
  final double bmi;

  ResultPage({this.bmi});

  String categoryUpper, category, range, remark;
  Color color;

  @override
  Widget build(BuildContext context) {
    if (bmi < 18.5) {
      categoryUpper = 'UNDERWEIGHT';
      category = 'Underweight';
      range = '0 - 18.5';
      remark = 'Eat a lot of Fats and Carbs. Good Luck!';
      color = Colors.red;
    } else if (bmi < 24.9) {
      categoryUpper = 'NORMAL';
      category = 'Normal';
      range = '18.5 - 24.9';
      remark = 'You have a normal body weight. Good job!';
      color = Colors.green;
    } else if (bmi < 29.9) {
      categoryUpper = 'OVERWEIGHT';
      category = 'Overweight';
      range = '24.9 - 29.9';
      remark = 'Go and hit the gym. Good Luck!';
      color = Colors.red;
    } else if (bmi < 39.9) {
      categoryUpper = 'OBESE';
      category = 'Obese';
      range = '29.9 - 39.9';
      remark = 'Go and hit the gym. Good Luck!';
      color = Colors.red;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI RESULT'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Center(
                  child: Text(
                'Your Result',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              ))),
          Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16, top: 8, bottom: 8),
                child: ReusableCard(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                          flex: 20,
                          child: Center(
                              child: Text(
                            '$categoryUpper',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: color),
                          ))),
                      Expanded(
                          flex: 20,
                          child: Center(
                              child: Text(
                            '${bmi.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontSize: 85, fontWeight: FontWeight.bold),
                          ))),
                      Expanded(
                        flex: 10,
                        child: Center(
                          child: Text(
                            '$category BMI range:',
                            style: TextStyle(
                                color: Color(0xFF8D909C), fontSize: 30),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 10,
                          child: Center(
                              child: Text(
                            '$range kg/m2',
                            style: TextStyle(fontSize: 30),
                          ))),
                      Expanded(
                          flex: 20,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              '$remark',
                              style: TextStyle(fontSize: 30),
                              textAlign: TextAlign.center,
                            )),
                          )),
                      Expanded(
                          flex: 20,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 40.0, right: 40, bottom: 16),
                            child: ReusableCard(
                              color: Color(0xFF0A0D20),
                              child: Center(
                                  child: Text(
                                'SAVE RESULT',
                                style: TextStyle(fontSize: 20),
                              )),
                            ),
                          ))
                    ],
                  ),
                ),
              )),
          Expanded(
              flex: 1,
              child: FlatButton(
                child: Text(
                  'CALCULATE YOUR BMI AGAIN',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  Navigator.pop(context,
                      MaterialPageRoute(builder: (context) => InputPage()));
                },
                color: Color(0xFFD93559),
              ))
        ],
      ),
    );
  }
}
