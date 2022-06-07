import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../exercise.dart';
import '../workout.dart';

class WorkoutsFirestoreProvider extends ChangeNotifier {
  final _firestore = FirebaseFirestore.instance;
  final _collectionRef = FirebaseFirestore.instance.collection('workouts');

  get firestore => _firestore;
  get collectionRef => _collectionRef;
  get snapshotsStream => _firestore.collection('workouts').snapshots();
  String newTitle = 'Workout Title';

  void addWorkout(String title, String category, List<Exercise> exercises) {
    var dataArray = [];
    for (var exercise in exercises) {
      Map<String, dynamic> data = {
        'exercise_name': exercise.title,
        'sets': exercise.sets,
        'reps': exercise.reps,
        'rest': exercise.rest,
      };
      dataArray.add(data);
    }
    _collectionRef.doc().set({
      'workout_name': title,
      'category': category,
      'exercise_array': dataArray,
    });
    notifyListeners();
  }

  void updateWorkout(Workout workout, String workoutID) {
    var dataArray = [];
    for (var exercise in workout.exerciseList) {
      Map<String, dynamic> data = {
        'exercise_name': exercise.title,
        'sets': exercise.sets,
        'reps': exercise.reps,
        'rest': exercise.rest,
      };
      dataArray.add(data);
    }
    _collectionRef.doc(workoutID).set({
      'workout_name': workout.title,
      'category': workout.category,
      'exercise_array': dataArray,
    });
    notifyListeners();
  }

  void deleteWorkout(String workoutID) {
    _collectionRef.doc(workoutID).delete();
    notifyListeners();
  }

  ///////////////
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

  ///

  void resetFields() {
    rest = false;
    doneWorkout = false;
    exerciseInProgressIndex = 0;
    newTitle = 'Workout Title';
    notifyListeners();
  }
}
