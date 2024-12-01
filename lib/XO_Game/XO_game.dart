import 'package:flutter/material.dart';

import 'BoraderButton_Screen.dart';

class XoGame extends StatefulWidget {
  @override
  State<XoGame> createState() => _XoGameState();
}

class _XoGameState extends State<XoGame> {
  int player1Score =0;
  int player2Score = 0;

  List<String> boardState = [
    '','','',
    '','','',
    '','','',
  ];



  //const XoGame({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          alignment: Alignment.center,
            child: Text('XO_Game',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),


      ),
      body: Container(
        color: Colors.black,
        child: Column(

         // crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,


                children: [
                  Column(


                   // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Text('player 1 :X',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                      Text('Score:$player1Score',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Column(


                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Text('player 2 :O',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                      Text('Score : $player2Score',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                    ],
                  )
                ],

              ),
            ),

            Expanded(
              child: Container(
               // color: Colors.red,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BoraderbuttonScreen(buttonTitel:boardState[0] ,onClickedButtonCallBack:onClikedButton ,index: 0,),
                  BoraderbuttonScreen(buttonTitel:boardState[1] ,onClickedButtonCallBack:onClikedButton ,index: 1,),
                  BoraderbuttonScreen(buttonTitel:boardState[2] ,onClickedButtonCallBack:onClikedButton ,index: 2,),

                ],


                          ),
              ),





            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BoraderbuttonScreen(buttonTitel:boardState[3] ,onClickedButtonCallBack:onClikedButton ,index: 3,),
                  BoraderbuttonScreen(buttonTitel:boardState[4] ,onClickedButtonCallBack:onClikedButton,index: 4, ),
                  BoraderbuttonScreen(buttonTitel:boardState[5] ,onClickedButtonCallBack:onClikedButton ,index: 5,),

                ],


              ),





            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BoraderbuttonScreen(buttonTitel:boardState[6] ,onClickedButtonCallBack:onClikedButton ,index: 6,),
                  BoraderbuttonScreen(buttonTitel:boardState[7] ,onClickedButtonCallBack:onClikedButton,index: 7, ),
                  BoraderbuttonScreen(buttonTitel:boardState[8] ,onClickedButtonCallBack:onClikedButton,index: 8, ),

                ],


              ),





            ),


          ],

        ),
      ),
    );
  }

  int counter = 0;
  bool isXNOW = true;

  onClikedButton(int index) {
    if (boardState[index].isNotEmpty) {
      return;
    }

      if (isXNOW) {
        boardState[index] = 'X';
        isXNOW = false;

        counter++;

        if (onCheckWinner('X')) {
          player1Score += 10;
          isXNOW = true;
          setState(() {

          });
          initBoard();
          return;
        }
      }

      //increase score
    else {
      boardState[index] = 'O';
      isXNOW = true;
      counter++;
      if (onCheckWinner('O')) {
        player2Score += 10;
        isXNOW = false;
       // isXNOW = false;
        setState(() {

        });
        initBoard();
        return;
      }
    }
  // counter++;
    if (counter ==9) {
      setState(() {});
      initBoard();
    }
    else {
      setState(() {});
    }
  }

  initBoard() {
      boardState = [

        '','','',
        '','','',
        '','','',

      ];
      counter = 0;
    }

  bool onCheckWinner(String symbolPlayer){
    for(int i=0 ; i<=6 ; i+=3 ){
      if(boardState[i]== symbolPlayer && boardState[i+1]==symbolPlayer && boardState[i+2]==symbolPlayer){
        return true;
      // }else{
      //   return false;
      }
    }
    for(int i =0 ; i<3 ;i++){
      if(boardState[i] == symbolPlayer && boardState[i+3] == symbolPlayer && boardState[i+6]==symbolPlayer) {
        return true;
      }
      // }else{
      //   return false;
      // }
    }
    for(int i=0 ; i<2 ;i++){
      if(boardState[0]==symbolPlayer && boardState[4]==symbolPlayer && boardState[8]==symbolPlayer) {
        return true;
      }
      if(boardState[2]==symbolPlayer && boardState[4]==symbolPlayer && boardState[6] == symbolPlayer){
        return true;
      }

    }
    return false;



  }




}

