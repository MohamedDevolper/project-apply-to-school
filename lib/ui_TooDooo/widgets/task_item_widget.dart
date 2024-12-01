import 'package:flutter/material.dart';

class TaskesTab extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Card(
    color: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 12),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 3,
              height: 90,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('play basket ball'),
                  Text('10:30 AM'),

                ],
              ),
            ),

            Container(

              decoration: BoxDecoration(
               //padding: EdgeInsets.symmetric(horizontal: 2,vertical: 4),
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).primaryColor,
              ),

              child: Icon(Icons.check,size:30,color: Colors.white,),

            ),
          ],

        ),
      ),
      
    );
  }
}
