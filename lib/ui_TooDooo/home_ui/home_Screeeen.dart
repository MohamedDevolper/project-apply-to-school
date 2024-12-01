import 'package:basics_project_flutter/ui_TooDooo/home_ui/setting_tab/Setting_Tab.dart';
import 'package:basics_project_flutter/ui_TooDooo/home_ui/task_tab/task_Tab.dart';
import 'package:flutter/material.dart';

import 'setting_tab/seetings_tabs.dart';


class HomeTOODOO extends StatefulWidget {


   HomeTOODOO({super.key});

  @override
  State<HomeTOODOO> createState() => _HomeTOODOOState();
}

class _HomeTOODOOState extends State<HomeTOODOO> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text('ToDo List'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
          onPressed: (){


      },child: Icon(Icons.add),),
      floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(

          currentIndex: selectedIndex,
          onTap: (index){

           // selectedIndex++;
            setState(() {
              selectedIndex = index;

            });


          },
          elevation: 0,
            backgroundColor: Colors.transparent,

            items: [
              BottomNavigationBarItem(icon: Icon(Icons.add),label:'Taskes' ),
              BottomNavigationBarItem(icon: Icon(Icons.settings,),label:'Taskes' ),
            ]),
      ),
      body: selectedTab[selectedIndex],

    );
  }

  List<Widget> selectedTab = [TaskTab(),SeetingsTabs()];
}
