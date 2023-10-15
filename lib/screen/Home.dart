import 'package:aleef/screen/Bird.dart';
import 'package:aleef/screen/Cat.dart';
import 'package:aleef/screen/Dog.dart';
import 'package:aleef/screen/Rabbits_Hamsters.dart';
import 'package:flutter/material.dart';

import '../constant/AppTitle.dart';
import '../constant/BottomBar.dart';
import '../constant/BottomBarSwitch.dart';
import '../constant/Navigators.dart';
import '../constant/SizeOfConfig.dart';
import '../constant/constant.dart';
class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map> categories =[
    {'name':'Dog','img':'assets/main/dog1.jpg','index':0},
    {'name':'Cat','img':'assets/main/cat1.jpg','index':1},
    {'name':'Rabbite And Hamester','img':'assets/main/cute1.jpg','index':2},
    {'name':'Bird','img':'assets/main/bird1.jpg','index':3},

  ];

  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    return Scaffold(
      bottomNavigationBar: BottomBar(
        BottomNu: 0,
        callBack:(index){
          BottomBarSwich(index, context);
        } ,


      ),
      backgroundColor: Color(0xffffffff),
      appBar:AppBar(
        backgroundColor:const Color(0xff85dd0b),
        title: const Text('Home'),


      ),
      drawer: bulidDrawer() ,

      body:SafeArea(
        child:
        Padding(
          padding: EdgeInsets.all(10),
          child: Column(
              children: [
                DiscountInterface(
                    discount: '30% Off',
                    discountDescriptiont: 'On all ..',
                    img: 'assets/cat/putty/8.png'),
                SizedBox(height: 15,),
                Expanded(
                    child: ListView(
                  children:
                  categories.map((Map title) => buildGestureDetector(title['name'],title['img'],title['index'],context)).toList(),



                )
                ),

              ]
          ),
        ),
      ),
    );
  }


  Widget buildGestureDetector(String name,String img,int index, BuildContext context){
    return GestureDetector(
      onTap: (){
        switch (index){
          case 0: pushNavigators(Dog(), context);break;
          case 1: pushNavigators(Cat(), context);break;
          case 2: pushNavigators(Rabbit(), context);break;
          case 3: pushNavigators(Bird(), context);break;


        }
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 10),
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
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(img,fit: BoxFit.cover,height: 250,width: 510,
              ),

            ),
            SizedBox(height: 10,),
            Text(name,style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 22,fontWeight: FontWeight.w800
            )
            )

          ],
        ),

      ),
    );
  }
}
class bulidDrawer extends StatelessWidget {
  bulidDrawer({Key? key}) : super(key: key);

  final List<Map>listTitles = [
    {'icon': Icons.category_outlined, 'title': 'Categories List '},
    {'icon': Icons.search, 'title': 'Search'},
    {'icon': Icons.shopping_cart, 'title': 'Cart'},
    {'icon': Icons.settings, 'title': 'Settings'},
    {'icon': Icons.help, 'title': 'Help'},
    {'icon': Icons.accessibility_rounded, 'title': 'About us'},
    {'icon': Icons.output, 'title': 'Sing Out'},
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xe5ffffff),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UserAccountsDrawerHeader(
            margin: EdgeInsets.zero,
            accountName: Text('Afnan Ghaleb'),
            accountEmail: Text('afnan222022@gmail.com'),
            decoration: BoxDecoration(
              color: Color(0xff85dd0b),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/main/afnan.jpg'),

            ),
            otherAccountsPictures: [
              Icon(Icons.settings, color: Colors.white, size: 30,),
              Icon(Icons.power_settings_new_outlined, color: Colors.white,
                size: 30,)
            ],
          ),
          const Divider(color: Color(0xff6fb60a), thickness: 15),
          Expanded(
            child: ListView(
                children:
                listTitles.map((Map tile) =>
                    buildListTile(tile['title'], tile['icon'], context)).toList()

            ),
          )
        ],
      ),
    );
  }

  ListTile buildListTile(String title, IconData icon, BuildContext context) {
    return ListTile(
      hoverColor: Color(0xff85dd0b),
      title: Text(title,
        style: const TextStyle(
          color: Color(0xff85dd0b),
          // fontFamily: 'Cairo'
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: Icon(icon, color: const Color(0xff85dd0b),),
      onTap: () {},
    );
  }
}
class DiscountInterface extends StatelessWidget {
  const DiscountInterface({
    Key? key,
    required this.discount,
    required this.discountDescriptiont,
    required this.img,

  }) : super(key: key);
  final String discount;
  final String discountDescriptiont;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getheightScreen(200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.4),
          blurRadius: 4,
          offset: const Offset(0, 6),
        ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(img,
              fit:BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),

          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.only(left:20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black.withOpacity(0.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: getheightScreen(50),
                    width: getWidthScreen(50),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(20),),
                      color: Color(0xcf85dd0b),

                    ),
                    child: const Center(
                      child: Text('cute',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              textShadow
                            ]
                        ),
                      ),
                    )
                ),
                SizedBox(height: getheightScreen(10),),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(discount,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.8),
                          shadows: const [
                            BoxShadow(color: Color(0xff85dd0b),blurRadius: 1,offset: Offset(-1, 2),)
                          ]
                      ),
                    ),
                    Text(discountDescriptiont,style: TextStyle(
                      shadows: const [
                        textShadow
                      ],
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.8),

                    ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
