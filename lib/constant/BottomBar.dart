import 'package:flutter/material.dart';

import 'SizeOfConfig.dart';
import 'constant.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key, this.BottomNu, this.callBack}) : super(key: key);

  final int? BottomNu;
  final Function? callBack;
  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    final bottoms=[
      Icons.home_filled,
      Icons.favorite,
      Icons.person_add_alt_1_rounded,

    ];
   return Container(
     color: const Color(0xff85dd0b),
     child:SizedBox(
       width: SizeOfConfig.widthScreen,
       height: getheightScreen(60),
     child: ListView.separated(
         scrollDirection:Axis.horizontal,
         itemBuilder: (_, index)=>  GestureDetector(
           child: Container(
             width: (SizeOfConfig.widthScreen-10)/3,
             decoration: BottomNu == index ? const BoxDecoration(
               border:Border(
                 bottom: borderStyle,
                 top: borderStyle,
                 right: borderStyle,
                 left: borderStyle,

               ))
                  :null,
             child: Icon(
               bottoms[index],
               size: BottomNu == index ? 35:30,
               color:
               BottomNu == index ? const Color(0xFFFFFFFF): const Color(
                   0xBAFFFFFF),
             ),
           ),
           onTap: () => callBack!(index),
         ),
         separatorBuilder:(_,index) => const SizedBox(width: 5,),
    itemCount: bottoms.length,
    ),
   ),
   );
  }
}
