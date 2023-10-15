// import 'dart:developer';
import 'package:flutter/material.dart';
import '../constant/AddCart.dart';
import '../constant/AppTitle.dart';
import '../constant/BottomBar.dart';
import '../constant/BottomBarSwitch.dart';
import '../constant/SizeOfConfig.dart';
import '../constant/constant.dart';
import '../item.dart';

class infItem extends StatefulWidget {
  const infItem({Key? key, required this.name, required this.img, required this.price}) : super(key: key);

  final String name;
  final String img;
  final double price;

  @override
  State<infItem> createState() => _BuyItemState();
}

class _BuyItemState extends State<infItem> {
  int counter=1;
  late String message='';
  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);

    return Scaffold(

      backgroundColor: Color(0xF4FFFFFF),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTitle('  ', context),


              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 10,
                      offset: const Offset(-3, 8),
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        widget.img,
                        fit: BoxFit.cover,
                        height: getheightScreen(300),
                        width: double.infinity,
                      ),
                    ),
                    Container(
                      padding:EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                      decoration: BoxDecoration(
                        color: Color(0xff85dd0b),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.name,
                            style: textStyle,),
                          Text('\$ ${widget.price}',style: textStyle),
                        ],

                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: getheightScreen(15),
              ),
              Expanded(child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)
                      ),
                      minWidth: getWidthScreen(10),
                      height: getheightScreen(60),
                      splashColor: Color(0x2196F3FF),
                      color: Color(0xff85dd0b),
                      onPressed: (){
                        setState(() {
                          if (counter>1) {
                            counter--;
                          }
                        });
                      },
                      child: Icon(

                        Icons.remove,
                        size: 30,
                        color: Colors.white,

                      ),),
                    Container(
                      width: getWidthScreen(150),
                      child: TextField(
                        enabled: false,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          contentPadding:const EdgeInsets.all(0),
                          hintText: '$counter',
                          hintStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff85dd0b),
                          ),
                          border: OutlineInputBorder(
                            borderRadius:   BorderRadius.circular(30),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                width: 9,
                                color: Color(0xffc92a2a),
                              )),
                        ),
                      ),
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)
                      ),
                      minWidth: getWidthScreen(10),
                      height: getheightScreen(60),
                      splashColor: Color(0x2196F3FF),
                      color: Color(0xff85dd0b),
                      onPressed: (){
                        setState(() {

                          counter++;

                        });
                      },
                      child: Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getheightScreen(13),
                ),
                Container(
                  width: getWidthScreen(200),
                  child: TextField(
                    textAlign:TextAlign.center,
                    onChanged: (value){
                    },
                    onTap: (){},
                    enabled: false,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      hintText: '\$ ${widget.price*counter}',
                      hintStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff85dd0b),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: getheightScreen(20),
                ),
                AddCart('Add to the cart', () {
                  setState(() {
                    favoriteItems.add(Item(0, widget.name, widget.img, widget.price));
                    message='Added to the cart successfully';

                  });
                }),
                SizedBox(
                  height: getheightScreen(10),
                ),
                Text(message,
                  style:TextStyle(
                      color: Color(0xff85dd0b),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.5),
                          blurRadius: 3,
                          offset: const Offset(1,3),
                        ),
                      ]
                  ),
                ),
                SizedBox(
                  height: getheightScreen(10),
                ),


                // MaterialButton(
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(40)
                //   ),
                //   minWidth: double.infinity,
                //   height: getheightScreen(60),
                //   splashColor: Color(0x219F3FF),
                //   color: Color(0xA646B9A4),
                //   onPressed: (){},
                //   child: Text(
                //     'Add to the cart',
                //     style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 20,
                //       color: Colors.white
                //     ),
                //   ),
                // )

              ],
              ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(
        callBack:(index){
          BottomBarSwich(index, context);
        } ,
      ),
    );
  }
}