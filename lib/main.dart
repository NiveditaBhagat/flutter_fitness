import 'package:flutter/material.dart';
import 'package:flutter_exercise/exercise_provider.dart';
import 'package:flutter_exercise/screens/main_page.dart';

import 'package:flutter_exercise/screens/sign_up_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  ExerciseProvider exerciseProvider = ExerciseProvider();
   runApp(
    ChangeNotifierProvider.value(
      value: exerciseProvider,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  Size(375, 812),
      builder: 
      (context, child){
      return  MaterialApp(
      debugShowCheckedModeBanner: false,
    home: child,

     
    );
    },
    child: MainPage(),
    );
  }
}

