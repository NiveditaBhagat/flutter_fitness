import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exercise/controller/data_controller.dart';
import 'package:flutter_exercise/screens/count_down_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../colors.dart';
import '../exercise_provider.dart';

class StepsScreen extends StatefulWidget {
  final String exerciseDocumentId;
  final Function fetchMethod;
  final String NameTitle;
  StepsScreen({
    required this.exerciseDocumentId,
    required this.fetchMethod,
    required this.NameTitle,
  });

  @override
  State<StepsScreen> createState() => _StepsScreenState();
}

class _StepsScreenState extends State<StepsScreen> {
   
  List<String> steps = [];
   @override
  void initState() {
    super.initState();
    
    loadSteps();
  }

  Future<void> loadSteps() async {

    List<String> fetchedSteps = await widget.fetchMethod(widget.exerciseDocumentId);
    print(fetchedSteps);
    // Update the state with the fetched steps
    setState(() {
      steps = fetchedSteps;
    });
  }
  @override
  Widget build(BuildContext context) {
    final exerciseProvider = Provider.of<ExerciseProvider>(context, listen: false);
    return Consumer<ExerciseProvider>(
      builder: (context, exerciseProvider, child) {
        return SafeArea(
          child: Scaffold(
           floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            floatingActionButton: SizedBox(
              height: 50.h,
              width: 300.h,
              child: FloatingActionButton(
                backgroundColor: primaryColor,
                onPressed: (){
                  final player=AudioPlayer();
                  player.play(AssetSource('audio.mp3'));
                   exerciseProvider.startExercise(
                        'Exercise Name',
                        Duration(minutes: 4),
                      );
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> CountDown(player: player,)));
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
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20.h, left: 10.w, bottom: 20.h),
                    child: Text(
                      widget.NameTitle,
                      style: TextStyle(
                        fontSize: 24.sp,
                        color: textBlack,
                        fontWeight: FontWeight.bold,
                      ),
                      
                      ),
                  ),
                  Container(
                    child: ListView.builder(
                       shrinkWrap: true,
                     itemCount: steps.length,
                      itemBuilder: (context, index) {
                       return ListTile(
                      title: Text(
                        'Step ${index + 1}',
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                      subtitle: Text(
                        steps[index],
                         style: TextStyle(
                          fontSize: 17.sp,
                          color: Colors.grey[700]
                        ),
                      ),
                    );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}