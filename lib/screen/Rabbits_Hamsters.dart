import 'package:flutter/material.dart';

import '../constant/AppTitle.dart';
import '../constant/BottomBar.dart';
import '../constant/BottomBarSwitch.dart';
import '../constant/Navigators.dart';
import '../constant/SizeOfConfig.dart';
import '../item.dart';
import 'infItem.dart';

class Rabbit extends StatelessWidget {
  final List<Map> rabbitList=[
    {'name':'Rody-3 Small rodent cage','img':'assets/cute/cage/8.jpeg',"price":2000.0},
    {'name':'Scavenge a small animal house','img':'assets/cute/cage/4.jpg',"price":3000.0},
    {'name':'Crunchy Steak Tales for Rabbits','img':'assets/cute/food/2.png',"price":1500.0},
    {'name':'food for baby rabbits','img':'assets/cute/food/1.jpg',"price":1000.0},
    {'name':'Silent Wheel Small Hamster','img':'assets/cute/game/2.jpg',"price":1100.0},
    {'name':'Small Animals Wooden Shelf','img':'assets/cute/game/1.png',"price":1100.0},
    {'name':'Little One Tasty bowl','img':'assets/cute/health/5.png',"price":700.0},
    {'name':'sandbox for chinchilla','img':'assets/cute/health/1.jpeg',"price":1500.0},


  ];

  List<Item> items = [
    Item( 0,'name', 'img',30.0),
  ];

  Rabbit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    return Scaffold(
      bottomNavigationBar: BottomBar(
        BottomNu: 3,
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
                AppTitle('Rabbit Products', context),
                Expanded(child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 8.0,
                  children:
                  rabbitList.map((Map rabbit) =>
                      buildGestureDetector
                        (rabbit["name"], rabbit["price"], rabbit["img"],
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
          color: Color(0xff85dd0b),
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