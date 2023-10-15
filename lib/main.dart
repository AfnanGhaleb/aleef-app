import 'package:aleef/component/onboardingPage.dart';
import 'package:aleef/screen/Home.dart';
import 'package:aleef/screen/SignIn.dart';
import 'package:aleef/screen/SplashScreen.dart';
import 'package:aleef/screen/onboarding.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'aleef',
      theme: ThemeData(


        primarySwatch: Colors.green,
      ),


      routes: {
        "/":(context)=> SpalshScreen(),
        "/home":(context)=> Home(),
      },


    );
  }
}

