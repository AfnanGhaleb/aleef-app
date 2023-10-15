import 'package:flutter/material.dart';

import '../constant/AppTitle.dart';
import '../constant/BottomBar.dart';
import '../constant/BottomBarSwitch.dart';
import '../constant/Navigators.dart';
import '../constant/SizeOfConfig.dart';
import '../item.dart';
import 'infItem.dart';

class Bird extends StatelessWidget {
  final List<Map> birdList=[
    {'name':'Cage Arabesque Anna','img':'assets/bird/cage/2.jpg',"price":300.0},
    {'name':'Small Bird Bath','img':'assets/bird/health/3.jpeg',"price":250.0},
    {'name':'Rio is a canary food','img':'assets/bird/food/4.png',"price":150.0},
    {'name':'bird sand with crystal<','img':'assets/bird/cage/4.jpg',"price":400.0},
    {'name':'ladder rope and leather','img':'assets/bird/game/2.jpeg',"price":750.0},
    {'name':'rope and wood ladder','img':'assets/bird/game/5.png',"price":100.0},
    {'name':'Versil to find verity fit','img':'assets/bird/health/5.png',"price":500.0},
    {'name':'food for all young birds','img':'assets/bird/food/3.png',"price":450.0},


  ];

  List<Item> items = [
    Item( 0,'name', 'img',30.0),
  ];

  Bird({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    return Scaffold(
      bottomNavigationBar: BottomBar(
        BottomNu: 4,
        callBack:(index){
          BottomBarSwich(index, context);
        } ,


      ),
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
        child:
        Padding(
          padding: EdgeInsets.all(10),
          child: Column(
              children: [
                AppTitle('Bird Products', context),
                Expanded(child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 8.0,
                  children:
                  birdList.map((Map bird) =>
                      buildGestureDetector
                        (bird["name"], bird["price"], bird["img"],
                          context)).toList()
                  ,
                )
                )
              ]
          ),

        ),
      ),

    );
  }
  Widget buildGestureDetector(String name ,double price ,String img,BuildContext context) {
    return GestureDetector(
      onTap: (){
        pushNavigators(infItem(name: name, img: img, price: price), context);
      },

      child: Container(
        height: getheightScreen(20),
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        margin: EdgeInsets.only(bottom: 25),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xff9fc222),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Colors.white.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(0,6),
          ),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child:Image.asset(img,
                  fit: BoxFit.cover,
                  height:getheightScreen(250),
                  width: getWidthScreen(510),) ,


              ),

            ),
            SizedBox(height: 10,),
            Text(name,style: TextStyle(
                color: Colors.white,fontSize: 17,fontWeight: FontWeight.w800
            )),
            Text('\$ $price',style: TextStyle(
                color: Colors.white,fontSize: 15,fontWeight:FontWeight.w800

            ))
          ],
        ),
      ),
    );
  }



}