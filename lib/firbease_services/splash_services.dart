
import 'dart:async';


import 'package:first_flutter_project/screens/login.dart';
import 'package:first_flutter_project/screens/signin_screen.dart';
import 'package:flutter/material.dart';

import '../screens/app_post.dart';

class SplashService {
  void isLogin(BuildContext context){
    Timer(Duration(seconds: 3),()=> Navigator.push(context , MaterialPageRoute(builder: (context)=> LoginScreen())));
    ;
  }
}