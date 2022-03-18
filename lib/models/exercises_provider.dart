import 'package:flutter/cupertino.dart';
import 'exercise.dart';

class ExercisesProvider extends ChangeNotifier {
  List<Exercise> _exercises = [];
  get exercises => _exercises;

  late String newExerciseTitle;
  late int newSets;
  late int newReps;
  late int newRest;

  void addExercise() {
    _exercises.add(Exercise(newExerciseTitle, newSets, newReps, newRest));
    notifyListeners();
  }

  void deleteExercise(Exercise exercise) {
    _exercises.remove(exercise);
    notifyListeners();
  }

  void reset() {
    _exercises = [];
    newExerciseTitle = '';
    newSets = 0;
    newReps = 0;
    newRest = 0;
  }
}
