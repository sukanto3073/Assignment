import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utitles/colors_masnager.dart';
import 'calendar_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screen = [HomeScreen(),CalenderScreen()];
  int? tabScreen = 0;

  void _onItemTapped(int index) {
    setState(() {
      tabScreen = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.bottom_appbar_colors,
      body: screen[tabScreen!],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
    shape: CircleBorder(),
    onPressed: (){},
    child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: ColorManager.floatingActionButton_colors
        ),
        child: const Icon(Icons.camera_alt_outlined, color: Colors.white, size: 28)
    ),
          ),
          bottomNavigationBar: BottomAppBar(
    //surfaceTintColor: Colors.white,
    elevation: 6,
    height: 65,
    color: ColorManager.bottom_appbar_colors,
    notchMargin: 6.0,
    shape: CircularNotchedRectangle(),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: [
        InkWell(
          onTap: (){
            _onItemTapped(0);
          },
          child: Padding(
            padding: EdgeInsets.only(left: 0.0),
            child: Icon(tabScreen==0?Icons.home:Icons.home_outlined,size: 28),
          ),
        ),
        InkWell(
          onTap: (){
            _onItemTapped(1);
          },
          child: Padding(
            padding: EdgeInsets.only(right: 5.0),
            child: Icon(tabScreen==1?Icons.calendar_month_rounded:Icons.calendar_month_outlined,size: 28),
          ),
        ),
        SizedBox(width: 20,),
        Padding(
          padding: EdgeInsets.only(right: 0.0),
          child: Icon(Icons.more_time_outlined,size: 28),
        ),
        Padding(
          padding: EdgeInsets.only(left: 0.0),
          child: Icon(Icons.person_4_outlined,size: 28),
        )
      ],
    ),
          ),
        );
  }
}
