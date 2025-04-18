import 'package:flutter/material.dart';

class DialogUtils{
  static void showLoadingDialoge(BuildContext context, {required String message}){
    showDialog(context:context ,builder:(context){
     return AlertDialog(
       content: Row(
         children: [
           Text(message,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),),
           SizedBox(width: 5,),
           CircularProgressIndicator(color: Color(0xFF019874),),
         ],
       ),

     );

    },);
  }
  static void hideDailog(BuildContext context){
Navigator.pop(context);
  }


  static void showMessageDialog (BuildContext context,{String? message,
  String? postActionTitle,String?negActionTitle,
    VoidCallback? posAction, VoidCallback ? negAction,
  }

      ){
    List<Widget>actions = [];
    if(postActionTitle != null){
      actions.add(TextButton(onPressed: (){
        Navigator.pop(context);
        posAction?.call();

      }, child: Text(postActionTitle,style: TextStyle(color: Color(0xFF019874),fontSize: 14,fontWeight: FontWeight.w500),)));

    }
    if(negActionTitle != null){
      actions.add(TextButton(onPressed: (){
        Navigator.pop(context);
        negAction?.call();

      }, child: Text(negActionTitle,style: TextStyle(color: Color(0xFF019874),fontSize: 14,fontWeight: FontWeight.w500),)));
    }
    showDialog(context: context, builder: (context){
      return AlertDialog(
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(message??'',style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500,),),
            ],
          ),
        ),
        actions:actions,

      );
      });

  }
}