import 'package:basics_project_flutter/Home_Screen_gradution/home_gradution.dart';
import 'package:flutter/material.dart';

class SplashScreeen extends StatelessWidget {
  static const String routeNamed = '/';
  const SplashScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),() {
      Navigator.pushReplacementNamed(context, HomeGradution.routeNamed);

    },);
    return Scaffold(
      body: Image.asset('assets/images/splash.png'),
    );
  }
}
