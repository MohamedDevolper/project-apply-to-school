import 'package:basics_project_flutter/Navigtor_Screnes/AppRoute.dart';
import 'package:basics_project_flutter/Navigtor_Screnes/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductSCreeen extends StatelessWidget {
  //static const String routeName = 'products';
  const ProductSCreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(onPressed: (){
          Navigator.pop(context);

        }, child: Text('back',style: TextStyle(color: Colors.black,),)),
        backgroundColor: Colors.blueAccent,
        
        title: Container(
          alignment: Alignment.center,
            child: Text('ProductScreen',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
        
      ),
      body: Column(
        children: [
          Text('Welcome to product screen',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
          MaterialButton(
            color: Colors.cyan,
            onPressed: (){
              Navigator.pushNamed(context,AppRoutes.detailsRoute);
              //Navigator.push(context, CupertinoPageRoute(builder: (context)=>ProductDetails()));
            
          },child: Text('Go to product details screen'),),
          SizedBox(
            width: double.infinity,
            height: 15,
          ),
          MaterialButton(
            color: Colors.blueAccent,
            onPressed: (){
              Navigator.pop(context);
            
          },child: Text('back to home screen......'),)
        ],
      ),
    );
  }
}
