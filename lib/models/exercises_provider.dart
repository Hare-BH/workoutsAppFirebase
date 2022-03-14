import 'package:flutter/cupertino.dart';

import 'exercise.dart';

class ExercisesProv extends ChangeNotifier {
  List<Exercise> exercises = [];

  void addExercise(Exercise exercise) {
    exercises.add(exercise);
    notifyListeners();
  }

  void deleteExercise(Exercise exercise) {
    exercises.remove(exercise);
    notifyListeners();
  }

  void deleteAll() {
    exercises.removeRange(0, exercises.length - 1);
  }
}
