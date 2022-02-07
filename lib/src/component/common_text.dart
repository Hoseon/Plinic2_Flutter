import 'package:flutter/material.dart';

Widget boldTextCommon(String label, double fontSize) {
  return Text(
    label,
    style: TextStyle(
      fontFamily: 'Roboto',
      color: Color(0xff1d1d1d),
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
    ),
  );
}

Widget regularTextCommon(String label, double fontSize) {
  return Text(
    label,
    style: TextStyle(
      fontFamily: 'Roboto',
      color: Color(0xff1d1d1d),
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  );
}
