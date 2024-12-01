import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  //static const  String routeName = 'Details';
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(onPressed: () {
          Navigator.pop(context);
          
        },child: Text('back',style: TextStyle(color: Colors.black,),)),
        backgroundColor: Colors.green,
        title: Container(
          alignment: Alignment.center,
            child: Text('ProductDetails',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),

      ),
      body: Column(

        children: [
          Container(
            alignment: Alignment.center,
              child: Text('Welcome to product details page ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)),
          MaterialButton(
            color: Colors.pink,
            onPressed: (){
              Navigator.pop(context);

          },child: Text('back to product page '),)
        ],
      ),
    );
  }
}
