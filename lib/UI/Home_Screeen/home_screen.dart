import 'package:basics_project_flutter/Image_path.dart';
import 'package:basics_project_flutter/UI/Home_Screeen/hadeth_tab/hadeth_home_tab.dart';
import 'package:basics_project_flutter/UI/Home_Screeen/quran_tab/guran_home_tab.dart';
import 'package:basics_project_flutter/UI/Home_Screeen/radio_tab/radio_home_tab.dart';
import 'package:basics_project_flutter/UI/Home_Screeen/sebha_tab/sebha_home_tab.dart';
import 'package:flutter/material.dart';

class HomeScreeen extends StatefulWidget {
  static const String routeNamed = '/home';

  @override
  State<HomeScreeen> createState() => _HomeScreeenState();
}

class _HomeScreeenState extends State<HomeScreeen> {
  int selectedIndexTab = 0;

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(

          image:DecorationImage(
            fit: BoxFit.fill,

            image:AssetImage(getImagePathByImageNamed(imageName: 'main_background_home_Screen.jpg'),



      )) ),width: double.infinity,height: double.infinity,
      child: Scaffold(

        appBar: AppBar(
          title: Text('Islami',),

        ),
       // backgroundColor: Color(0xFFB7935F),
        bottomNavigationBar: Theme(
           data: Theme.of(context).copyWith(
             canvasColor: Theme.of(context).colorScheme.primary,
           ),

          child: BottomNavigationBar(
            currentIndex: selectedIndexTab,
              onTap: (idex) {
              selectedIndexTab = idex;
             // print(selectedIndex);
              setState(() {

              });


              },
              items: [

            BottomNavigationBarItem(
          //backgroundColor: Color(0xFFB7935F),
                icon: ImageIcon(AssetImage(getImagePathByImageNamed(imageName: 'radio.png'))),label: 'Radio'),
            BottomNavigationBarItem(
               // backgroundColor: Color(0xFFB7935F),
                icon: ImageIcon(AssetImage(getImagePathByImageNamed(imageName: 'sebha.png'))),label: 'Sebha'),
            BottomNavigationBarItem(
               // backgroundColor: Color(0xFFB7935F),
                icon: ImageIcon(AssetImage(getImagePathByImageNamed(imageName: 'hadeth_ic.png'))),label: 'Hadeth'),
            BottomNavigationBarItem(
              //  backgroundColor: Color(0xFFB7935F),
                icon: ImageIcon(AssetImage(getImagePathByImageNamed(imageName: 'quran.png'))),label: 'Quran'),
          ]),
        ),
        body: tab[selectedIndexTab],





      ),


    );

  }

  var tab = [RadioTab(),SebhaTab(),HadetTab(),QuranTab()];
}
