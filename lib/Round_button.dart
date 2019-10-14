import 'package:flutter/material.dart';




class Roundbutton extends StatelessWidget {
  final Icon icon;
  final Function onPressed;

  Roundbutton({this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: icon,
        onPressed: onPressed,
        fillColor: Color(0xFF4C5FE),
        elevation: 6.0,
        constraints: BoxConstraints(minWidth: 56, minHeight: 56),
        shape: CircleBorder()
    );
  }
}

