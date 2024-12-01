import 'package:basics_project_flutter/Navigtor_Screnes/AppRoute.dart';
import 'package:basics_project_flutter/Navigtor_Screnes/product_details.dart';
import 'package:basics_project_flutter/Navigtor_Screnes/product_screnn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreenF extends StatelessWidget {
  //static const String routeName = 'home';
  const HomeScreenF({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.purple,


        title: Container(
          alignment: Alignment.center,
            child: Text('Home_Screen',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)),


      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Text('this is home screen',style: TextStyle(color: Colors.black,fontSize: 40,fontWeight: FontWeight.bold)),
            MaterialButton(
              color: Colors.yellow,
              onPressed:(){
               // Navigator.push(context, MaterialPageRoute(builder: (context) => ProductSCreeen()));
                Navigator.pushNamed(context, AppRoutes.productRoutes);
          },child: Text('go to product screen',),),
            SizedBox(
              width: double.infinity,
              height: 15,
            ),
            MaterialButton(
              color: Colors.green,
              onPressed: (){
                Navigator.pushNamed(context,AppRoutes.detailsRoute);
//Navigator.push(context, CupertinoPageRoute(builder: (context) => ProductDetails()));

            },child: Text('go to products details'),)
          ],
        ),
      ),
    );
  }
}
