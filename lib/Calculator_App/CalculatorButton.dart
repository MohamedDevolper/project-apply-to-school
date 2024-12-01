import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {

  String buttonTitle ;
  Function onClikedButton;
  CalculatorButton({required this.buttonTitle,required this.onClikedButton});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(2),
        child: ElevatedButton(onPressed:(){
          onClikedButton(buttonTitle);

          //print(buttonTitle);
        
        }, child:Text(buttonTitle,style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),) ),
      ),
    );
  }
}
