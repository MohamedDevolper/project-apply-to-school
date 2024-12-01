import 'package:basics_project_flutter/cooore/app_routes.dart';
import 'package:basics_project_flutter/cooore/theme/app_theme.dart';
import 'package:basics_project_flutter/ui_TooDooo/home_ui/home_Screeeen.dart';
import 'package:flutter/material.dart';

import 'authentiction/login/login_screen.dart';
import 'authentiction/register/register_Screen.dart';

void main(){
  runApp(MyApp());


}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,

      routes:{
        AppRoute.routeNamed:(_)=> HomeTOODOO(),
        AppRoute.registerRoute:(_)=>RegisterScreen(),
        AppRoute.loginRoute:(_)=> LoginScreen(),

      } ,
      initialRoute: AppRoute.loginRoute,

    );
  }
}
