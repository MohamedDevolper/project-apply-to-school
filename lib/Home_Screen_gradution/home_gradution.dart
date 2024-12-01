import 'package:flutter/material.dart';

class HomeGradution extends StatelessWidget {
  static const String routeNamed = '/home';

  const HomeGradution({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(

          image: DecorationImage(
            fit: BoxFit.fill,

            image: AssetImage('assets/images/sign up screen.png'),


          )), width: double.infinity, height: double.infinity,


    );

  }
}