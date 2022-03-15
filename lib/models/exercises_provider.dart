import 'package:flutter/cupertino.dart';

import 'exercise.dart';

class ExercisesProvider extends ChangeNotifier {
  List<Exercise> exercises = [];

  get exer => exercises;

  void addExercise(Exercise exercise) {
    exercises.add(exercise);
    notifyListeners();
  }

  void setExerciseList(List<Exercise> newList) {
    exercises = newList;
    notifyListeners();
  }

  void deleteExercise(Exercise exercise) {
    exercises.remove(exercise);
    notifyListeners();
  }

  void deleteAll() {
    exercises.removeRange(0, exercises.length - 1);
    notifyListeners();
  }
}
