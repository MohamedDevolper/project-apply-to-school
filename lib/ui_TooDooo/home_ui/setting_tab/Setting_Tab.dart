import 'package:basics_project_flutter/ui_TooDooo/home_ui/setting_tab/theme_bottom_sheet.dart';
import 'package:flutter/material.dart';

import 'LanguageBottomSheet.dart';

class SettingTab extends StatefulWidget {
  const SettingTab({super.key});

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24,horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Theme',style: Theme.of(context).textTheme.labelMedium,),
          SizedBox(height: 9,),

          InkWell(
            onTap:(){
              showThemeBottomSheet();
            },
            child: Container(

              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 12),
              padding: EdgeInsets.symmetric(vertical: 6,horizontal:4),

              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                border: Border.all(color: Theme.of(context).primaryColor,width: 4)
              ),
                child: Text('Light')),
          ),
          SizedBox(height: 20,),
          Text('Language ',style: Theme.of(context).textTheme.labelMedium,),
          SizedBox(height: 9,),
          InkWell(
            onTap: (){
              showLanguageBottomSheet();
            },
            child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 12),
                padding: EdgeInsets.symmetric(vertical: 6,horizontal:4),

                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    border: Border.all(color: Theme.of(context).primaryColor,width: 4)
                ),
                child: Text('English')),
          ),
        ],

      ),
    );
    void showBottomSheet(){

    }
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(context: context, builder: (context)=>ThemeBottomSheet());
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(context: context, builder: (context)=>  LanguageBottomSheet());
  }
}
