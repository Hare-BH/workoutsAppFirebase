import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import '../exercise.dart';
import '../workout.dart';

class WorkoutsBoxProvider extends ChangeNotifier {
  final Box _workoutsBox = Hive.box('workouts');
  get workoutsBox => _workoutsBox;

  String newTitle = 'default';

  Workout getAtIndex(int index) => _workoutsBox.getAt(index);
  int boxLength() => _workoutsBox.length;

  void addWorkout(String title, String category, List<Exercise> exercises) {
    Box workoutsBox = Hive.box('workouts');
    workoutsBox.add(Workout(title, category, exercises));
    notifyListeners();
  }

  // void updateWorkout(Workout workout, int index) {
//   Box workoutsBox = Hive.box('workouts');
//   workoutsBox.putAt(index, workout);
//   notifyListeners();
// }

  void deleteAll() {
    _workoutsBox.deleteAll(_workoutsBox.keys);
    notifyListeners();
  }

  int exerciseInProgressIndex = 0;

  void incrementExerciseIndex() {
    exerciseInProgressIndex++;
    notifyListeners();
  }

  void decrementExerciseIndex() {
    exerciseInProgressIndex--;
    notifyListeners();
  }

  void resetExerciseIndex() {
    exerciseInProgressIndex = 0;
    notifyListeners();
  }

  ///

  ///is rest time active used in "in_progress_bottom_card"
  bool rest = false;

  void restTrue() {
    rest = true;
    notifyListeners();
  }

  void restFalse() {
    rest = false;
    notifyListeners();
  }

  ///

  ///is workout done used in "in_progress_page"
  bool doneWorkout = false;

  void doneWorkoutTrue() {
    doneWorkout = true;
    notifyListeners();
  }

  void doneWorkoutFalse() {
    doneWorkout = false;
    notifyListeners();
  }

  ///

  ///
  late int currentReps;

  void setReps(int reps) {
    currentReps = reps;
    notifyListeners();
  }

  void decrementReps() {
    currentReps--;
    notifyListeners();
  }
}
