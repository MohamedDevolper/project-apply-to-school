import 'package:basics_project_flutter/XO_Game/XO_game.dart';
import 'package:flutter/material.dart';
typedef OnClickedButtonCallBack = void Function(int index);
class BoraderbuttonScreen extends StatelessWidget {

  String buttonTitel ;
  OnClickedButtonCallBack onClickedButtonCallBack;
  int index ;
  BoraderbuttonScreen({required this.buttonTitel,required this.onClickedButtonCallBack,required this.index});


 // const BoraderbuttonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(2),
        child: MaterialButton(
          color: Colors.white38,
          onPressed: () {
            onClickedButtonCallBack(index);


        }, child: Text(buttonTitel,style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),),
      ),
    );
  }
  
}
