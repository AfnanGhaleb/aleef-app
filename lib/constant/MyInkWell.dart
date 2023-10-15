import 'package:flutter/material.dart';

Widget myInkWell(String text,Function() press){
  return InkWell(
    child: Text(text,
    style: TextStyle(
      fontWeight: FontWeight.w700,
      color: Color(0xff85dd0b),fontSize: 20
    ),
    ),
    onTap: press,
  );
}