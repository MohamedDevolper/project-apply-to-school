import 'package:basics_project_flutter/Categories_Widget.dart';
import 'package:basics_project_flutter/Title_Widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MagazineScreen extends StatelessWidget {
  List<DataItem> allData = [];

  MagazineScreen() {
    for (int i = 0; i < 100; i++) {
      allData.add(DataItem(
          imagePath: 'assets/images/messi-world-cup.jpg', title: 'Messi $i'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MagazineScreen', style: TextStyle(
            color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 30,),),
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body:GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,crossAxisSpacing: 5, childAspectRatio: 1/2,mainAxisSpacing: 5 ),
          itemCount: allData.length,
            itemBuilder: (context,index)
          => CategoriesWidget(dataItem: allData[index])




        )

        );



  }
  CategoriesWidget giveCategoryWidget(BuildContext, int index){
    return CategoriesWidget(dataItem: allData[index]);

  }

  }




CategoriesWidget getCategoryWidget(DataItem dattaItem){
  return CategoriesWidget(dataItem: dattaItem);
}

// data class
class DataItem{
  String imagePath;
  String title;
  DataItem({required this.imagePath,required this.title});
}
