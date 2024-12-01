import 'package:flutter/material.dart';

class suraTitelWidget extends StatelessWidget {
  String suraTitel;
  String numberOfVerses ;
   suraTitelWidget({required this.suraTitel,required this.numberOfVerses});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(suraTitel,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400,color: Color(0xFF242424)),),

            ),
          ),
          Container(
            width: 4,
            height: 30,
            color: Color(0xFFB7935F),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(numberOfVerses,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400,color: Color(0xFF242424)),),
            ),
          )
        ],
      ),
    );
    
  }
}
