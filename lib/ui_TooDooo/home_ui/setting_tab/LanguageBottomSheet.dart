import 'package:flutter/material.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSelectedItemLanguage('English'),

          SizedBox(height: 18,),

          buildunSelectedItemLanguage('Arabic'),

        ],
      ),


    );

  }

  Widget buildSelectedItemLanguage(String SelectedLanguage){
    return Row(

      children: [

        Expanded(child: Text(SelectedLanguage,style: Theme.of(context).textTheme.headlineMedium,)),
        Icon(Icons.check,color: Theme.of(context).primaryColor,size: 28,),
      ],
    );

  }
  Widget buildunSelectedItemLanguage(String unselectedItemLanguage ){
    return Text(unselectedItemLanguage,style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 18));


  }
}
