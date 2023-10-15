import 'package:flutter/material.dart';

import '../constant/AppTitle.dart';
import '../constant/BottomBar.dart';
import '../constant/BottomBarSwitch.dart';
import '../item.dart';


class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomBar(
        BottomNu: 1,
        callBack:(index){
          BottomBarSwich(index, context);
        } ,


      ),
      backgroundColor: const Color(0xffffffff),
      body:SafeArea(
        child:
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
              children: [
                AppTitle('Favorite', context),
                Expanded(child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        children: [
                          Text(favoriteItems[index].name,style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold,),),
                          const SizedBox(height: 10,),
                        ],
                      ),
                    );
                  },
                  itemCount: favoriteItems.length,


                )
                ),
              ]
          ),
        ),
      ),
    );
  }
}
