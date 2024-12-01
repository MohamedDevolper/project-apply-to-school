import 'package:basics_project_flutter/Magazune_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {

DataItem dataItem;
CategoriesWidget({required this.dataItem});

  @override
  Widget build(BuildContext context) {
    return  Container(
     //  color: Colors.purple,
      child: Stack(
        alignment: Alignment.bottomRight,

        children: [
          Image.asset(dataItem.imagePath,fit: BoxFit.cover,width: double.infinity ,height: double.infinity,),

          Container(
            margin: EdgeInsets.all(3),
            padding: EdgeInsets.symmetric(horizontal:2,vertical: 2),

            child: Container(
              //color: Colors.purple,
                alignment: Alignment.bottomRight,
                child: Container(
                  color: Colors.purple,
                    child: Text(dataItem.title))),
          )
        ],
      ),
    );
  }
}
