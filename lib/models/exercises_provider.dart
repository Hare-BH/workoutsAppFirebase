import 'package:flutter/cupertino.dart';

import 'exercise.dart';

class ExercisesProvider extends ChangeNotifier {
  List<Exercise> exercises = [];

  late String newExerciseTitle;
  late int newSets;
  late int newReps;
  late int newRest;

  void addExercise() {
    exercises.add(Exercise(newExerciseTitle, newSets, newReps, newRest));
    notifyListeners();
  }

  void updateList(List<Exercise> newList) {
    for (var exercise in newList) {
      exercises.add(exercise);
    }
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
    exercises.clear();
    notifyListeners();
  }
}
