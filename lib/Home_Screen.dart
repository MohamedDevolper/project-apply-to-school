import 'package:basics_project_flutter/Counter_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  static const routeNamed = ' home screeeeen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        title: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            //color: Colors.red,
            child: Text('Home Screen', style: TextStyle(color: Colors.red,
              fontSize: 18,
              fontWeight: FontWeight.w900,
              backgroundColor: Colors.black,),)),
        centerTitle: true,

        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(),
      backgroundColor: Colors.blueGrey,

       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [

             ElevatedButton(onPressed: (){
               Navigator.pushNamed(context, CounterScreen.routeName);

             },
                 child: Text('go to next screen',textAlign: TextAlign.end,style: TextStyle(color: Colors.black),)),

           ],
         ),
       )



      //   child:Stack(
        //
        //     alignment: Alignment.bottomRight,
        //     children: [
        //
        //       Container(
        //         //padding: EdgeInsets.all(70),
        //         //margin: EdgeInsets.all(25),
        //         width: 100,
        //         height: 100,
        //         color: Colors.white,
        //
        //       ),
        //       Container(
        //         color: Colors.white,
        //         child: Stack(
        //           children: [
        //             Container(
        //               width: 50,
        //               height: 50,
        //               color: Colors.yellow,
        //             ),
        //             Container(
        //               color: Colors.blue,
        //               child: Stack(
        //                 children: [
        //                   Container(
        //                     width: 25,
        //                     height: 25,
        //                     color: Colors.black,
        //
        //                   ),
        //
        //                 ],
        //               )
        //
        //             )
        //           ],
        //
        //         ),
        //       )
        //
        //     ],
        //   ),
        //
        //
        //  ),
        //
        //
        //
        //
        //
        //
      // );
      );


  }
}