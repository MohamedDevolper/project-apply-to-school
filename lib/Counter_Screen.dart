import 'package:basics_project_flutter/Login_Scrren.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget{
  static const routeName = 'CounterScreen';

  @override
  State<CounterScreen> createState() {
    return CounterScreenState();

  }

}
class CounterScreenState extends State<CounterScreen>{
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Counter Screen ',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w900,),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$counter',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold,),),
            ElevatedButton(onPressed:(){
              Navigator.pushNamed(context, LoginScreen.routeName);


            },
              child: Text('go to login screen'),),


          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){

        setState(() {
          counter++;
        });
        print(counter);


        
    }, 
        child: Icon(Icons.add),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
  
}