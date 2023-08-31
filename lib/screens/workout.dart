import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors.dart';

class Workout extends StatefulWidget {
  const Workout({super.key});

  @override
  State<Workout> createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  final List <String> title=[
    "Yoga", 
    "Pilates", 
    "Full Body", 
    "Stretching", 
  ];
  final List <String> ImagePath=[
"assets/yoga.png",
"assets/pilates.png",
"assets/full_body.png",
"assets/stretching.png",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       
        body: Column(
         
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Workouts",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: textBlack,
                fontSize: 24.sp
              ),
            ),
            Expanded(
              child: ListView.builder(
                
                itemCount: 4,
                itemBuilder: (context,index){
                  return Padding(
                    padding:  EdgeInsets.only(top: 20.h, left: 20.w,right: 20.w),
                    child: Container(
                       height: 140.h,
                       width: 480.w,
                      decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: textBlack.withOpacity(0.12),
                                  blurRadius: 5.0,
                                  spreadRadius: 1.1,
                              ),
                            ],
                      ),
                      child: Padding(
                        padding:  EdgeInsets.only(left: 8.w, right: 10.w, top: 10.h, bottom: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  title[index],
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      color: textBlack,
                                      fontWeight: FontWeight.bold,
                                  ),
                                  
                                  ),
                                  Text(
                                    "3 Exercises",
                                    style: TextStyle(
                                      color: grey,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "12 Minutes",
                                    style: TextStyle(
                                      color: grey,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                Container(
                                  height: 7.h,
                                  width: 100.w,
                                  child: Center(
                                    child: FAProgressBar(
                                      backgroundColor: Colors.grey.shade300,
                                      progressColor: primaryColor,
                                                          currentValue: 55,
                                                          
                                                        
                                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 120.h,
                                  width: 150.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(ImagePath[index]))
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
                
                ),
            ),
          ],
        ),
      ),
    );
  }
}