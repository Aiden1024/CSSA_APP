import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Styles {
  static Color primaryColor = const Color(0xFFb53029);
  static Color textColor = const Color(0xFF3b3b3b);
  static Color bgColor = const Color(0xFFeeedf2);


  static TextStyle textStyle = TextStyle(
    fontSize: 16,
    color: textColor,
    fontWeight: FontWeight.w500
  );

  static TextStyle headLineStyle1 = TextStyle(
      fontSize: 26,
      color: textColor,
      fontWeight: FontWeight.bold
  );

  static TextStyle headLineStyle2 = TextStyle(
      fontSize: 21,
      color: textColor,
      fontWeight: FontWeight.bold
  );

  static TextStyle headLineStyle3 = TextStyle(
      fontSize: 17,
      color: Colors.grey[500],
      fontWeight: FontWeight.w500
  );

  static TextStyle headLineStyle4 = TextStyle(
      fontSize: 14,
      color: Colors.grey[500],
      fontWeight: FontWeight.w500
  );

  static InputDecoration textInputDecoration1 = InputDecoration(
    fillColor: Colors.white,
    // filled: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: textColor, width: 2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.red, width: 2),
    ),
  );

  static InputDecoration textInputDecoration2 = InputDecoration(
    icon: Icon(Icons.favorite),
    labelText: 'Label text',
    // suffixIcon: Icon(
    //   Icons.check_circle,
    // ),
    enabledBorder: UnderlineInputBorder(
    ),
  );
}