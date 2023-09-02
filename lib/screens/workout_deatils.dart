import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_exercise/colors.dart';
import 'package:flutter_exercise/controller/data_controller.dart';
import 'package:flutter_exercise/model/data_model.dart';
import 'package:flutter_exercise/screens/steps_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkoutDetail extends StatefulWidget {
  final String title;
final WorkoutDetailMethods methods;

   WorkoutDetail({
    required this.title,
    required this.methods,
   });

  @override
  State<WorkoutDetail> createState() => _WorkoutDetailState();
}

class _WorkoutDetailState extends State<WorkoutDetail> {
   YogaDataFetcher dataFetcher = YogaDataFetcher();
  List<String> WorkoutNames = [];
  List<String> WorkoutImages = [];


  @override
  void initState() {
    super.initState();
    fetchDataFromFirestore();
  }

  Future<void> fetchDataFromFirestore() async {
    
   List<String> names = await widget.methods.fetchNames();
    List<String> images = await widget.methods.fetchImages();
    setState(() {
      WorkoutNames = names;
      WorkoutImages=images;
    });
  }




 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 50.h,
        width: 300.h,
        child: FloatingActionButton(
          backgroundColor: primaryColor,
          onPressed: (){
            //Navigator.push(context, MaterialPageRoute(builder: (context)=> YogaList()));
          },
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
          child: Text(
            "START",
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
          ),
      ),
      body: Container(
    
           width: double.maxFinite,
        height: double.maxFinite,
       
        child: Stack(
          children: [
            
             Positioned(
              right: 0.w,
              left: 0.w,
              child: Container(
                      height: 320.h,
                       decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/yoga.png"))
        ),
              ),
              ),
            
              Positioned(
                bottom: 0.h,
                child: Container(
                  height: 520.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35.r),
                    topRight: Radius.circular(35.r),
                  ),
                  color: Color.fromRGBO(252, 252, 252, 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                       Padding(
                         padding:  EdgeInsets.only(left: 35.w, top: 15.h, bottom: 20.h),
                         child: Text(
                          widget.title, 
                          style: TextStyle(
                         color: textBlack,
                         fontSize: 25.sp,
                         fontWeight: FontWeight.bold
                                     ),),
                       ),
                      Expanded(
                        child: ListView.builder(
                           padding: EdgeInsets.zero,
                          itemCount: 3,
                          itemBuilder: (context, index){
                              String name = WorkoutNames[index];
                            return Padding(
                              padding:  EdgeInsets.only( right: 15.w, left: 15.h, bottom: 15.h),
                              child: GestureDetector(
                                onTap: (){},
                                child: Container(
                                  height: 110.h,
                                  width: double.infinity,
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
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 100.h,
                                        width: 100.w,
                                        child: Image.network(WorkoutImages[index], fit: BoxFit.cover,),
                                      ),
                                      SizedBox(width: 10.h,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 15.h,),
                                          Text(
                                           name,
                                            style: TextStyle(
                                              fontSize: 20.sp,
                                              color: textBlack,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                         
                                        Text(
                                            "4 minutes",
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: grey,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                         Container(
                                                height: 7.h,
                                                width: 170.w,
                                                child: Center(
                                                  child: FAProgressBar(
                                                    backgroundColor: Color.fromARGB(255, 218, 213, 245),
                                                    progressColor: primaryColor,
                                                                        currentValue: 0,
                                                                        
                                                                      
                                                                      ),
                                                ),
                                              ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                ),
                              ),
                            );
                        }),
                      ),
                    ],
                  ),
                )
                ),
               
          ],
        ),
      ),
    );
  }
}