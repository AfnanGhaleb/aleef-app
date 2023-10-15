import 'package:flutter/material.dart';

class SizeOfConfig{
  static late MediaQueryData _mediaQueryData;
  static late double heightScreen;
  static late double widthScreen;
  static double?defultSize;
  static Orientation? _orientation;
  
  void init (BuildContext context){
    _mediaQueryData =MediaQuery.of(context);
    widthScreen = _mediaQueryData.size.width;
    heightScreen = _mediaQueryData.size.height;
    _orientation = _mediaQueryData.orientation;
  }

}

double getWidthScreen(double inputWidth){
  double widthScreen = SizeOfConfig.widthScreen;
  return(inputWidth/315.0)*widthScreen;
}

double getheightScreen(double inputheight){
  double heightScreen = SizeOfConfig.heightScreen;
  return(inputheight/815.0)*heightScreen;
}