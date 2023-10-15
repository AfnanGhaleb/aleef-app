import 'dart:async';

import 'package:aleef/screen/onboarding.dart';
import 'package:flutter/material.dart';

import '../constant/Navigators.dart';
import '../constant/SizeOfConfig.dart';
import 'Home.dart';


class SpalshScreen extends StatefulWidget {
  const SpalshScreen({Key? key}) : super(key: key);

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  void initState(){
    super.initState();
    Timer(
        Duration(seconds: 5),
            (){pushNavigators(onboarding(), context);}
    );
  }
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),


      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/categories/Main dishes.jpg'),
            fit: BoxFit.cover,
            opacity: 0.7,

          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  // CircleAvatar(
                  //   radius: 100,
                  //   backgroundColor: Colors.white.withOpacity(0.8),
                  // ),
                  Image.asset('assets/main/logo.png',height: getheightScreen(300),
                    width: getWidthScreen(300),
                  ),
                ],
              ),
              SizedBox(height: 40,),
              const Text('   ALEEF STOR',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Color(0xff9fc222),
                    shadows: [
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(-2, 4),
                        blurRadius: 10,
                      )
                    ]
                ),
              ),
              SizedBox(height: getWidthScreen(20),),
              CircularProgressIndicator(
                backgroundColor: Colors.white,
                color: Color(0xff9fc222),
              )
            ],
          ),
        ),
      ),
    );
  }
}
