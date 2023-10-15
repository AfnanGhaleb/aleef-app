import 'package:flutter/material.dart';

import '../constant/AppTitle.dart';
import '../constant/BottomBar.dart';
import '../constant/BottomBarSwitch.dart';
import '../constant/Navigators.dart';
import '../constant/SizeOfConfig.dart';
import '../item.dart';
import 'infItem.dart';

class Dog extends StatelessWidget {
  final List<Map> dogList=[
    {'name':'Water purification filter','img':'assets/dog/food-e/1.jpeg',"price":150.0},
    {'name':'Zolux "Bagatelle" Bed','img':'assets/dog/home/1.jpeg',"price":150.0},
    {'name':'Orbitus Smart Link Pet Feeder','img':'assets/dog/food-e/5.jpg',"price":300.0},
    {'name':'dog food with lamb and rice','img':'assets/dog/food/6.png',"price":150.0},
    {'name':'Josie Duke Jr. Rare 18 kg','img':'assets/dog/food/7.png',"price":100.0},
    {'name':'Sunglasses for cats and dogs','img':'assets/dog/ecces/3.jpeg',"price":500.0},
    {'name':'Check tie','img':'assets/dog/ecces/8.jpeg',"price":250.0},
    {'name':'Zolux Wooden Dog House','img':'assets/dog/home/3.jpeg',"price":4500.0},


  ];

  List<Item> items = [
    Item( 0,'name', 'img',30.0),
  ];

  Dog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    return Scaffold(
      bottomNavigationBar: BottomBar(
        BottomNu: 1,
        callBack:(index){
          BottomBarSwich(index, context);
        } ,


      ),
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child:
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
              children: [
                AppTitle('Dog Products', context),
                Expanded(child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 8.0,
                  children:
                  dogList.map((Map dog) =>
                      buildGestureDetector
                        (dog["name"], dog["price"], dog["img"],
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
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        margin: const EdgeInsets.only(bottom: 25),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xff85dd0b),
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
            const SizedBox(height: 10,),
            Text(name,style: const TextStyle(
                color: Colors.white,fontSize: 17,fontWeight: FontWeight.w800
            )),
            Text('\$ $price',style: const TextStyle(
                color: Colors.white,fontSize: 15,fontWeight:FontWeight.w800

            ))
          ],
        ),
      ),
    );
  }



}