import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'exercise.dart';
import 'workout.dart';

class WorkoutsBoxProvider extends ChangeNotifier {
  Box workoutsBox = Hive.box('workouts');

  void addWorkout(String title, String category, List<Exercise> exercises) {
    Box workoutsBox = Hive.box('workouts');
    workoutsBox.add(Workout(title, category, exercises));
    notifyListeners();
  }

  void updateWorkout(Workout workout, int index) {
    Box workoutsBox = Hive.box('workouts');
    workoutsBox.putAt(index, workout);
    notifyListeners();
  }

  void deleteAll() {
    workoutsBox.deleteAll(workoutsBox.keys);
    notifyListeners();
  }

  String newTitle = 'default';

  // void addTitle(String title) {
  //   newTitle = title;
  //   notifyListeners();
  // }
}
