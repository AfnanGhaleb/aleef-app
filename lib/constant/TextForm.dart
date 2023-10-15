import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
   TextForm({Key? key, this.lableText, this.mykey, required this.obscureText,
     this.icon, this.controller,this.validation, this.press,
     this.hint }) : super(key: key);

  final String ?lableText;
  final TextInputType ?mykey;
  late final bool obscureText;
  final IconData ?icon;
  final TextEditingController ?controller;
  final Function ?validation;
  final Function ?press;
  final String ?hint;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: mykey,
      validator: validation as String ? Function(String?),
      onChanged: press as void  Function(String?),
      controller: controller,
      obscureText: obscureText,

      style: const TextStyle(
        fontSize: 20,
        color: Color(0xff85dd0b)
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: Color(0xff85dd0b),
          fontSize: 18
        ),
        labelText: lableText,
        labelStyle: const TextStyle(
          fontSize: 18,color: Color(0xff85dd0b),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 2,
            color: Color(0xff85dd0b)
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 4,
            color: Color(0xff85dd0b)
          )
          
        ),
        suffixIcon: Icon(icon,color: Color(0xff85dd0b),
        ),
      ),
    );

  }
}
