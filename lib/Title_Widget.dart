import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  String title ;
   TitleWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      flex: 1,
      child: Container(
          alignment: Alignment.center,
          color: Colors.purple,
          padding: EdgeInsets.symmetric(horizontal: 18,vertical: 8),
          margin: EdgeInsets.all(1),
          child: Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 15,),)),
    );

  }
}
