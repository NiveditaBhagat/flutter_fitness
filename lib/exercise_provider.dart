import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExerciseProvider extends ChangeNotifier {
  // Initialize SharedPreferences
  final String _completedExercisesKey = 'completedExercises';
  final String _totalTimeSpentKey = 'totalTimeSpent';
  final String _inProgressExerciseKey = 'inProgressExercise';
  
  int completedExercises = 0;
  int totalTimeSpentInMinutes = 0; // Store total time spent in minutes
  String inProgressExercise = ''; // Store the name of the in-progress exercise
  
  ExerciseProvider() {
    loadState();
  }

  Future<void> startExercise(String exerciseName, Duration exerciseDuration) async {
    inProgressExercise = exerciseName;
    notifyListeners();

    await Future.delayed(exerciseDuration, () {
      completedExercises++;
      totalTimeSpentInMinutes += exerciseDuration.inMinutes;
      inProgressExercise = '';
      saveState();
      notifyListeners();
    });
  }

  void stopExercise() {
    if (inProgressExercise.isNotEmpty) {
      // Exercise was stopped prematurely, update state accordingly.
      inProgressExercise = '';
      saveState();
      notifyListeners();
    }
  }

  Future<void> saveState() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(_completedExercisesKey, completedExercises);
    prefs.setInt(_totalTimeSpentKey, totalTimeSpentInMinutes);
    prefs.setString(_inProgressExerciseKey, inProgressExercise);
  }

  Future<void> loadState() async {
    final prefs = await SharedPreferences.getInstance();
    completedExercises = prefs.getInt(_completedExercisesKey) ?? 0;
    totalTimeSpentInMinutes = prefs.getInt(_totalTimeSpentKey) ?? 0;
    inProgressExercise = prefs.getString(_inProgressExerciseKey) ?? '';
    notifyListeners();
  }
}
