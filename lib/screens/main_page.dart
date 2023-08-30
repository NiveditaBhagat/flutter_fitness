import 'package:flutter/material.dart';
import 'package:flutter_exercise/colors.dart';

import 'package:flutter_exercise/screens/home.dart';
import 'package:flutter_exercise/screens/settings.dart';
import 'package:flutter_exercise/screens/workout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
   var pages = [
        Home(),
        Workout(),
        Settings(),
  ];
    int _currentIndex=0;
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
        
    bottomNavigationBar:Container(
      height: 80.h,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, 
          unselectedItemColor:Colors.grey[400],
         backgroundColor: Colors.white,
           selectedItemColor:  primaryColor,
               onTap: (value) {
          setState(() {
            _currentIndex=value;
          });
              },
              currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_fire_department_rounded),
            label: "Workouts"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
           label: "Settings"
             ),
         
         
        ],
      ),
    ),
     body: pages[_currentIndex],
    );
  }
}