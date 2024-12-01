import 'package:basics_project_flutter/Image_path.dart';
import 'package:flutter/material.dart';

import '../../Home_Screen.dart';
import '../Home_Screeen/home_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeNamed = '/';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, HomeScreeen.routeNamed);
    },);

    return Scaffold(
      body: Image.asset(getImagePathByImageNamed(imageName: 'splash.png'),width: double.infinity,height: double.infinity,fit: BoxFit.fill,),
    );


  }
}
