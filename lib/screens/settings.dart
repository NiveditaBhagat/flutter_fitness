import 'package:flutter/material.dart';
import 'package:flutter_exercise/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 244, 255),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(right: 20.w, left: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              CircleAvatar(
                              radius: 50.r,
                             backgroundImage: AssetImage('assets/profile.jpg'),
                            ),
                            SizedBox(height: 15.h,),
                Container(
                  height: 40.h,
                  width:300.h,
                  decoration: BoxDecoration(
                    color:  Color.fromARGB(255, 203, 189, 245),
                    borderRadius: BorderRadius.circular(20.r),
                    
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Calender",
                     style: TextStyle(
                      fontSize: 15.sp,
                      color: primaryColor,
                     ),
                    ),
                  ),
                ),
                SizedBox(height: 15.h,),
                 Container(
                  height: 40.h,
                  width:300.h,
                  decoration: BoxDecoration(
                    color:  Color.fromARGB(255, 203, 189, 245),
                    borderRadius: BorderRadius.circular(20.r),
                    
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Track Exercises",
                     style: TextStyle(
                      fontSize: 15.sp,
                      color: primaryColor,
                     ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}