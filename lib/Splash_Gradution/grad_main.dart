import 'package:basics_project_flutter/Home_Screen_gradution/home_gradution.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'Splash_Screen.dart';
import '../UI/Splash/splash_Screen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        SplashScreeen.routeNamed:(_)=> SplashScreeen(),
        HomeGradution.routeNamed:(_)=> HomeGradution(),
      },
    );
  }
}
