import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = 'LoginScreen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
        title: Text('LoginScreen',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 30,backgroundColor: Colors.purple),)



      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to here',style: TextStyle(color:Colors.red,fontSize: 30,fontWeight: FontWeight.w900),),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            },
                child: Text('back to counter Screen')),
          ],
        ),
      ),
    );
  }
}
