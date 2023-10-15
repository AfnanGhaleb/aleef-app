import 'package:flutter/material.dart';

Widget AppTitle(String title,BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back,color: Color(0xff85dd0b),size: 30,),
      ),
      Center(
        child: Text(title,style: TextStyle(color: Color(0xff85dd0b),fontSize: 40),),
      ),
      SizedBox(height: 20,)
    ],
  );
}