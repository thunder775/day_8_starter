import 'package:day_8_starter/input_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0D20),
          scaffoldBackgroundColor: Color(0xFF0A0D20),
          accentColor: Color(0xFFEA1556) // TO be pinkish shade
          ),
    );
  }
}
