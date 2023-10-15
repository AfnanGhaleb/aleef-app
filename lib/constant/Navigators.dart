import 'package:flutter/material.dart';

pushNavigators(pageName,BuildContext context){
 Navigator.push(context,
     MaterialPageRoute(
         builder: (context)=>pageName
     )
 );

}