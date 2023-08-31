import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkoutCard extends StatelessWidget {
  final Color color;
  final Function() onTap;
  final String image;
  final String title;
  WorkoutCard({
    required this.color,
    required this.onTap,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
     return Padding(
       padding: EdgeInsets.only(right: 7.w, left: 7.w),
       child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding:  EdgeInsets.only(
            left: 20.w,
            top: 5.h,
            right: 12.w,
          ),
          height: 200.h,
          width: 210.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: color,
          ),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       SizedBox(height: 5.h),
                      Text(
                       title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                       SizedBox(height: 25.h),
                      Text(
                        "3 exercises",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                       SizedBox(height: 5.h),
                      Text(
                        "12 minutes",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              
              Positioned(
            
                right: 0,
                bottom: 0,
                child: Image(
                  image: AssetImage(image),
                ),
              ),
            ],
          ),
        ),
         ),
     );
  }
}