import 'package:flutter/material.dart';

class AppTheme{
  static const Color primaryColorLightTheme = Color(0xFF5D9CEC);
  static const ScafoldBgColor = Color(0xFFDFECDB);
  static const geryColor = Color(0xFFC8C9CB);
      static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColorLightTheme,
    colorScheme: ColorScheme.fromSeed(seedColor:primaryColorLightTheme,
    primary: primaryColorLightTheme,
      onPrimary: Colors.white
    ),
    useMaterial3: false,
    appBarTheme: AppBarTheme(
     // color: Color(0xFF5D9CEC),

      backgroundColor: primaryColorLightTheme,
      centerTitle: true,
      titleTextStyle: TextStyle(fontWeight: FontWeight.w700,fontSize: 22,color: Colors.white),
    ),
        scaffoldBackgroundColor: ScafoldBgColor,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColorLightTheme,
          backgroundColor: Colors.transparent,
          elevation: 0,
          unselectedItemColor:geryColor,
        ),
        cardTheme: CardTheme(
          color: Colors.white
        ),
        textTheme: TextTheme(
          titleMedium: TextStyle(fontSize: 14,color:primaryColorLightTheme,fontWeight: FontWeight.bold ),
          titleSmall: TextStyle(fontWeight: FontWeight.normal,color: Colors.black),
          labelMedium: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
          headlineMedium: TextStyle(fontWeight: FontWeight.bold,color: primaryColorLightTheme,fontSize: 18),


        ),




  );

  
}