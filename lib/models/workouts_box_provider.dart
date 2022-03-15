import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'workout.dart';

class WorkoutsBoxProvider extends ChangeNotifier {
  Box workoutsBox = Hive.box('workouts');

  void addWorkout(Workout workout) {
    Box workoutsBox = Hive.box('workouts');
    workoutsBox.add(workout);
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
}
