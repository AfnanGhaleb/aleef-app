import 'package:aleef/component/RoundButton.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
    OnboardingPage({Key? key, required this.image, required this.title, required this.description, required this.noOfScreen, required this.onNextPressed, required this.currentScreenNo}) : super(key: key);

  final Image image;
  final String title;
  final String description;
  final int noOfScreen;
  final Function(int) onNextPressed;
  final int currentScreenNo;

  @override
  Widget build(BuildContext context) {
    bool isLestScreen = currentScreenNo >=noOfScreen - 1;
    return Padding(
        padding: const EdgeInsets.all(10),
      child:Column(
      children: [
        Expanded(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              image,
              const SizedBox(
                height: 20,
              ),
              Text(
                title,style: TextStyle(fontSize: 30,color: Color(0xff85dd0b)),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  description,style: TextStyle(fontSize: 20,color: Color(0xff85dd0b)),
                ),
              ),

            ],
          ),
        ),
        Visibility(
          visible: !isLestScreen,
          replacement:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width:300,
                  height: 50,
                  child: RoundButton(title: "Get Started ", onPressed: (){
                    openHome(context);
                  }))
            ],
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RoundButton(
                title: "Skip",
                onPressed: (){
                  openHome(context);
                },
              ),
              Row(
                children: [
                  for( int index =0;index< noOfScreen; index++)
                    creatProgressDots((index == currentScreenNo) ? true :false)

                    ],
              )
              ,RoundButton(
                title: "Next",
                onPressed: (){
                  onNextPressed(currentScreenNo + 1);
                },
              )
            ],
          ),
        )
      ],
      ));
  }

  Widget creatProgressDots(bool isActiveScreen){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: isActiveScreen?15: 10,
      width: isActiveScreen?15: 10,
      decoration:  BoxDecoration(
        color: isActiveScreen?Color(0xff85dd0b) :Colors.grey,
        borderRadius:const BorderRadius.all(Radius.circular(12))
      ),
    );
  }
  void openHome (BuildContext context){
    Navigator.pushReplacementNamed(context, "/home");
  }
}
