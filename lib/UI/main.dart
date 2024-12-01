import 'package:basics_project_flutter/Home_Screen.dart';
import 'package:basics_project_flutter/UI/Home_Screeen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Splash/splash_Screen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        SplashScreen.routeNamed :(_)=> SplashScreen(),
        HomeScreeen.routeNamed : (_)=> HomeScreeen(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFB7935F),
          primary: Color(0xFFB7935F),
        ),


        appBarTheme: AppBarTheme(
          
          titleTextStyle: TextStyle(fontSize: 25,fontWeight: FontWeight.w900,color: Colors.black),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 2,
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ))
        ),
             scaffoldBackgroundColor: Colors.transparent,
       // canvasColor: Color(0xFFB7935F),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(


          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedIconTheme: IconThemeData(
            size: 40,
          ),
          unselectedIconTheme: IconThemeData(
            size: 30 ,
          ),


        ),

      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF141A2E),
          primary: Color(0xFF141A2E),
        ),
       
        appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(fontSize: 25,fontWeight: FontWeight.w900,color: Colors.white),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 2,
            shape: RoundedRectangleBorder( borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ))

        ),
        scaffoldBackgroundColor: Colors.transparent,
        //canvasColor: Color(0xFF141A2E),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.yellow,
          unselectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false,


        ),

      ),
      themeMode: ThemeMode.light,
    );
  }
}
