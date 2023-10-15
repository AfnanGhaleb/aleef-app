import 'package:aleef/component/onboardingPage.dart';
import 'package:flutter/material.dart';

class onboarding extends StatelessWidget {
  onboarding({Key? key}) : super(key: key);

  PageController contrller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: contrller,
        physics:const NeverScrollableScrollPhysics(),
        children: [
          OnboardingPage(
            image: Image.asset('assets/intro/112.jpg'),
              title: 'welcome',
              description: '           welcome to best animal stor \nHere you will find all you need for your pet' ,
              noOfScreen:3 ,
            onNextPressed: changeScreen,
            currentScreenNo: 0,

          ),
          OnboardingPage(image: Image.asset('assets/intro/222.jpg'),
            title: 'No just pets ',
            description: 'There are family ',
            noOfScreen:3 ,
            onNextPressed: changeScreen,
            currentScreenNo: 1,

          ),
          OnboardingPage(image: Image.asset('assets/intro/332.jpg'),
            title: 'soo cute  ',
            description: 'Get what you need for your prts enjoy',

            noOfScreen:3 ,
            onNextPressed: changeScreen,
            currentScreenNo: 2,

          ),
        ],

      ),
    );
  }
  void changeScreen(int nextScreenNo){
contrller.animateToPage(nextScreenNo, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }
}
