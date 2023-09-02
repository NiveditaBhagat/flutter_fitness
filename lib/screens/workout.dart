import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_exercise/controller/data_controller.dart';
import 'package:flutter_exercise/model/data_model.dart';
import 'package:flutter_exercise/screens/workout_deatils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors.dart';

class Workout extends StatefulWidget {
  const Workout({super.key});

  @override
  State<Workout> createState() => _WorkoutState();
}
 YogaDataFetcher yogaDataFetcher = YogaDataFetcher();
    PilatesDataFetcher pilatesDataFetcher = PilatesDataFetcher();
    FullBodyDataFetcher fullBodyDataFetcher = FullBodyDataFetcher();
    StrechingDataFetcher strechingDataFetcher=StrechingDataFetcher();
     final List<WorkoutDetailMethods> workoutMethodsList = [
  WorkoutDetailMethods(
    fetchNames: () => yogaDataFetcher.fetchYogaNames(),
    fetchImages: () => yogaDataFetcher.fetchYogaImages(),
  ),
  WorkoutDetailMethods(
    fetchNames: () => pilatesDataFetcher.fetchPilatesNames(),
    fetchImages: () => pilatesDataFetcher.fetchPilatesImages(),
  ),
  WorkoutDetailMethods(
    fetchNames: () => fullBodyDataFetcher.fetchFullBodyNames(),
    fetchImages: () => fullBodyDataFetcher.fetchFullBodyImages(),
  ),
  WorkoutDetailMethods(
    fetchNames: () => strechingDataFetcher.fetchStretchingNames(),
    fetchImages: () => strechingDataFetcher.fetchStretchingImages(),
  ),
];
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
            Padding(
              padding:  EdgeInsets.only(top: 15.h, left: 25.w, ),
              child: Text(
                "Workouts",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textBlack,
                  fontSize: 24.sp
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                
                itemCount: 4,
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>WorkoutDetail(
                        title: title[index],
                       methods: workoutMethodsList[index],
                        )));
                    },
                    child: Padding(
                      padding:  EdgeInsets.only(top: 20.h, left: 20.w,right: 20.w),
                      child: Container(
                         height: 130.h,
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
                              Padding(
                                padding:  EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      title[index],
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          color: textBlack,
                                          fontWeight: FontWeight.bold,
                                      ),
                                      
                                      ),
                                      SizedBox(height: 10.h,),
                                      Text(
                                        "3 Exercises",
                                        style: TextStyle(
                                          color: grey,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                       SizedBox(height: 5.h,),
                                      Text(
                                        "12 Minutes",
                                        style: TextStyle(
                                          color: grey,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                       SizedBox(height: 11.h,),
                                    Container(
                                      height: 7.h,
                                      width: 110.w,
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
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 110.h,
                                    width: 130.w,
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