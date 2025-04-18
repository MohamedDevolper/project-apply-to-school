import 'package:basics_project_flutter/Splash_Gradution/Splash_Screen.dart';
import 'package:basics_project_flutter/cooore/app_routes.dart';
import 'package:basics_project_flutter/cooore/theme/app_theme.dart';
import 'package:basics_project_flutter/firebase_options.dart';
import 'package:basics_project_flutter/ui_TooDooo/home_ui/home_Screeeen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'authentiction/Home_gradution/home_gradution.dart';
import 'authentiction/login/login_screen.dart';
import 'authentiction/register/register_Screen.dart';
import 'package:flutter/services.dart';
//fff

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform);


  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,

      routes:{
        AppRoute.splashRoute:(_)=> SplashScreeen(),
        AppRoute.registerRoute:(_)=>RegisterScreen(),
        AppRoute.loginRoute:(_)=> LoginScreen(),
        AppRoute.gradutionRoute:(_)=> HomeGradution(),

       // AppRoute.routeNamed:(_)=> HomeTOODOO(),

      } ,
      initialRoute: AppRoute.splashRoute,

    );
  }
}
