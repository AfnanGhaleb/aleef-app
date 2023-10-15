import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'SizeOfConfig.dart';

Widget ButtoItem(
String imagePath,String buttonName,Function() onTap, BuildContext context)
{
  SizeOfConfig().init(context);
  return InkWell(
    onTap: onTap,
    child: Container(
      width: SizeOfConfig.widthScreen,
      height: 60,
      child: Card(
       elevation: 8,
        color: Color(0xff85dd0b),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(
            width: 1,
            color: Color(0x83FFFFFF)
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              imagePath,
              height: 35,
              width: 35,
            ),
            Text(
              buttonName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            )
          ],
        ),
      ),
    ),
  );
}