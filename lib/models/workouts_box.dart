import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'workout.dart';

class WorkoutsBox extends ChangeNotifier {
  Box workoutsBox = Hive.box('workouts');

  void addWorkout(Workout workout) {
    Box workoutsBox = Hive.box('workouts');
    workoutsBox.add(workout);
    notifyListeners();
  }

  void deleteAll() {
    workoutsBox.deleteAll(workoutsBox.keys);
    notifyListeners();
  }
}
