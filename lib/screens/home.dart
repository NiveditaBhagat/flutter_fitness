import 'package:flutter/material.dart';
import 'package:flutter_exercise/colors.dart';
import 'package:flutter_exercise/screens/workout.dart';
import 'package:flutter_exercise/widgets/workout_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      backgroundColor: Color.fromRGBO(252, 252, 252, 1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: 20.h, left: 35.w, right: 35.w),
                    child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi, Jane",
                          style: TextStyle(
                            fontSize: 30.sp,
                            color: textBlack,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 9.h,
                        ),
                        Text(
                          "Let's check your activity",
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: textColor,
                            fontWeight: FontWeight.w400,
                          ),
                        
                        ),
                      ],
                    ),
                  ),
                  
                  Padding(
                    padding:  EdgeInsets.only( right: 25.w, top: 20.h),
                    child: CircleAvatar(
                      radius: 40.r,
                    ),
                  )
                ],
              ),
              Padding(
                padding:  EdgeInsets.only(left: 25.w),
                child: Container(
                  height: 300.h,
                  
                  child: Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 40.h,),
                          Container(
                            height: 250.h,
                            width: 140.w,
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(left: 23.w),
                                    child: Row(
                                     
                                      children: [
                                        Image(
                                          image: AssetImage(
                                            'assets/finished.png'
                                          ),
                                          ),
                                          SizedBox(width: 10.w,),
                                          Expanded(
                                            child: Text(
                                              "Finished",
                                              style: TextStyle(
                                                color: textBlack,
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.bold
                                              ),
                                               overflow: TextOverflow.fade,
                                               softWrap: false, 
                                            ),
                                            
                                          )
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "1",
                                    style: TextStyle(
                                      fontSize: 45.sp,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text(
                                    "Completed       Workouts",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: textGrey,
                                    ),
                                  )
                                    
                                ],
                              ),
                            
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(left:20.w, top: 40.h ),
                            child: Container(
                              height: 110.h,
                              width: 170.w,
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
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding:  EdgeInsets.only(left: 23.w),
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                        'assets/inProgress.png',
                                                      ),
                                                      SizedBox(width: 10.w),
                                                      Text(
                                                        "In progress",
                                                      style: TextStyle(
                                                     fontSize: 17.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: textBlack,
                                                     ),
                                                   ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:  EdgeInsets.only(left: 25.w),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "1",
                                                        style: TextStyle(
                                                          fontSize: 30.sp,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      SizedBox(width: 10.w),
                                                       Text(
                                                        "Workouts",
                                                        style: TextStyle(
                                                          fontSize: 16.sp,
                                                          fontWeight: FontWeight.w500,
                                                          color: textGrey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left:20.w,  top: 20.h),
                            child: Container(
                              height: 110.h,
                              width: 170.w,
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
                                             child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding:  EdgeInsets.only(left: 23.w),
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                        'assets/time.png',
                                                      ),
                                                      SizedBox(width: 10.w),
                                                      Text(
                                                        "Time spent",
                                                      style: TextStyle(
                                                     fontSize: 17.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: textBlack,
                                                     ),
                                                   ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:  EdgeInsets.only(left: 25.w),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "22",
                                                        style: TextStyle(
                                                          fontSize: 26.sp,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      SizedBox(width: 10.w),
                                                       Text(
                                                        "Minutes",
                                                        style: TextStyle(
                                                          fontSize: 16.sp,
                                                          fontWeight: FontWeight.w500,
                                                          color: textGrey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                            ),
                          ),
                          
                        ],
                       ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.h,),
              Padding(
                padding: EdgeInsets.only(left: 20.w,),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Discover new Workouts",
                    
                    style: TextStyle(
                      color: textBlack,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp,
                    ),
                    
                    ),
                ),
              ),
                Padding(
                  padding:  EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h),
                  child: Container(
                    height: 160.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                          WorkoutCard(
                            color: cardioColor, 
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Workout()));
                            }, 
                            image: 'assets/cardio.png', 
                            title: 'Yoga',
                            ),
                            SizedBox(height: 15.h),
                            WorkoutCard(
                              color: armsColor, 
                              onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Workout()));
                            }, 
                               image: 'assets/arms.png', 
                               title: 'Full Body')
                
                      ],
                    ),
                  ),
                )
        
            ],
          ),
        ),
      ),
    );
  }
}