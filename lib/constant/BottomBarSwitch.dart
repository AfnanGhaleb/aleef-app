import 'package:aleef/screen/Bird.dart';
import 'package:aleef/screen/SignIn.dart';
import 'package:aleef/screen/favorite.dart';
import 'package:flutter/material.dart';

import '../screen/Home.dart';
import 'Navigators.dart';

void BottomBarSwich(int index,BuildContext context)
{
  switch(index){
    case 0:pushNavigators(Home(), context);break;
    case 1:pushNavigators(Favorite(), context);break;
    case 2:pushNavigators(SignIn(), context);break;
  }

}