import 'package:basics_project_flutter/Home_Screen.dart';
import 'package:basics_project_flutter/Navigtor_Screnes/Home_Screen.dart';
import 'package:basics_project_flutter/Navigtor_Screnes/product_details.dart';
import 'package:basics_project_flutter/Navigtor_Screnes/product_screnn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AppRoute.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routes: {
      //   AppRoutes.homeRoute:(_)=> HomeScreenF(),
      //   AppRoutes.productRoutes:(_)=>ProductSCreeen(),
      //   AppRoutes.detailsRoute:(_)=>ProductDetails(),
      // },
      //initialRoute: AppRoutes.homeRoute,
      onGenerateRoute:(settings){
        print(settings.name);
        switch(settings.name){
          case AppRoutes.homeRoute:
            return MaterialPageRoute(builder: (context)=>HomeScreenF(),);
          case AppRoutes.productRoutes:
            return CupertinoPageRoute(builder: (context)=>ProductSCreeen());
          case AppRoutes.detailsRoute:
            return CupertinoPageRoute(builder: (context)=>ProductDetails());
        }
      }
    );
  }
}
