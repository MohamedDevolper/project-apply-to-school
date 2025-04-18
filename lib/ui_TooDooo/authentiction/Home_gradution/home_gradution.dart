import 'package:flutter/material.dart';
import 'tabs/upload_tab/upload_page.dart';
import 'tabs/option_tab/option_page.dart';
import 'tabs/profile_tab/profile_page.dart';

class HomeGradution extends StatefulWidget {
  const HomeGradution({super.key});

  @override
  State<HomeGradution> createState() => _HomeGradutionState();
}

class _HomeGradutionState extends State<HomeGradution> {
  int _selectedIndex = 0; // مؤشر الشاشة النشطة

  // قائمة الشاشات
  final List<Widget> _tabs = [
    const UploadPage(), // الصفحة الأولى (Upload Page)
     OptionPage(), // الصفحة الثانية (Options Page)
     ProfileScreen(), // الصفحة الثالثة (Profile Page)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'Kidney App',
      //     style: TextStyle(
      //       fontSize: 25,
      //       fontWeight: FontWeight.bold,
      //       color: Color(0xFF019874),
      //     ),
      //   ),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   leading: GestureDetector(
      //     onTap: () {
      //       Navigator.pop(context);
      //     },
      //     child: Row(
      //       children: const [
      //         Icon(Icons.arrow_back_ios_new, color: Colors.black),
      //         SizedBox(width: 2),
      //         Expanded(
      //           child: Text(
      //             "Back",
      //             style: TextStyle(
      //               color: Colors.black,
      //               fontSize: 12,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    // backgroundColor: Colors.white,
      body: _tabs[_selectedIndex], // تحديد الشاشة بناءً على المؤشر
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index; // تحديث الشاشة النشطة
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Options',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: const Color(0xFF019874),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
