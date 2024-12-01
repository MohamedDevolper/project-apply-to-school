import 'package:basics_project_flutter/Counter_Screen.dart';
import 'package:basics_project_flutter/Home_Screen.dart';
import 'package:basics_project_flutter/Login_Scrren.dart';
import 'package:basics_project_flutter/Magazune_Screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());

}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Hello Flutter',
   // home: CounterScreen(),
    routes: {
      HomeScreen.routeNamed:(context)=>HomeScreen(),
      CounterScreen.routeName:(context)=>CounterScreen(),
      LoginScreen.routeName:(context)=>LoginScreen(),
    },
    initialRoute:HomeScreen.routeNamed ,
  );
  }
}
