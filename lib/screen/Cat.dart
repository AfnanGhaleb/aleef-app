import 'package:flutter/material.dart';

import '../constant/AppTitle.dart';
import '../constant/BottomBar.dart';
import '../constant/BottomBarSwitch.dart';
import '../constant/Navigators.dart';
import '../constant/SizeOfConfig.dart';
import '../item.dart';
import 'infItem.dart';

class Cat extends StatelessWidget {
  final List<Map> catList=[
    {'name':'Circular gray bed','img':'assets/cat/home/11.png',"price":2000.0},
    {'name':'Smart Link Pet Feeder','img':'assets/cat/food-e/5.png',"price":9000.0},
    {'name':'Mio chitin food fish','img':'assets/cat/food/6.jpeg',"price":1500.0},
    {'name':'Sunglasses for cats','img':'assets/cat/ecsses/1.png',"price":1000.0},
    {'name':'A bed shape of a cat','img':'assets/cat/home/22.png',"price":5000.0},
    {'name':'dry food with tuna','img':'assets/cat/food/10.png',"price":250.0},
    {'name':'Dog Fragrance','img':'assets/cat/putty/12.jpeg',"price":1500.0},
    {'name':'hody for medium ','img':'assets/cat/ecsses/4.png',"price":4500.0},


  ];

  List<Item> items = [
    Item( 0,'name', 'img',30.0),
  ];

  Cat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    return Scaffold(
      bottomNavigationBar: BottomBar(
        BottomNu: 2,
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
                AppTitle('Cat Products', context),
                Expanded(child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 8.0,
                  children:
                 catList.map((Map cat) =>
                      buildGestureDetector
                        (cat["name"], cat["price"], cat["img"],
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