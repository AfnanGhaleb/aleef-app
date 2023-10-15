import 'package:flutter/material.dart';

Widget AddCart(String text ,Function() press)
{
  return SizedBox(
    width: double.infinity,
    height: 56,
    child: TextButton(
      style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),

          ),
          primary: Colors.white,
          backgroundColor: Color(0xff85dd0b)
      ),
      onPressed: press as void Function(),
      child: Text(
        text ,
        style: TextStyle(
            fontSize: 18,
            color: Colors.white
        ),
      ),
    ),

  );
}
