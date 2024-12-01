
import 'package:basics_project_flutter/Calculator_App/CalculatorScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyAppliction());
}
class MyAppliction extends StatelessWidget {
  
  const MyAppliction({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
      ),

     // home: CalculatorScreen(textView: ,),
      routes: {CalculatorScreen.routeName:(context)=>CalculatorScreen()},
      initialRoute: CalculatorScreen.routeName,

    );

  }
}
