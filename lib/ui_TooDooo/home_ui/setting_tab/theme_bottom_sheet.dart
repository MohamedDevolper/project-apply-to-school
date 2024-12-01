import 'package:flutter/material.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSelectedItemTheme('Light'),

          SizedBox(height: 18,),

          buildunSelectedItemTheme('Dark'),

        ],
      ),


    );

  }

  Widget buildSelectedItemTheme(String SelectedTheme){
    return Row(

      children: [

        Expanded(child: Text(SelectedTheme,style: Theme.of(context).textTheme.headlineMedium,)),
        Icon(Icons.check,color: Theme.of(context).primaryColor,size: 28,),
      ],
    );

  }
  Widget buildunSelectedItemTheme(String unselectedItemTheme){
    return Text(unselectedItemTheme,style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 18));


  }
}
