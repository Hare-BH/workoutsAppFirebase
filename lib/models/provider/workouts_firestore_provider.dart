import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../exercise.dart';
import '../workout.dart';

class WorkoutsFirestoreProvider extends ChangeNotifier {
  //final _firestore = FirebaseFirestore.instance;
  //final CollectionReference _collectionRef =
  //    FirebaseFirestore.instance.collection('workouts');

  get collectionRef => usersCollection.doc(uid).collection('workouts');
  get snapshotsStream =>
      usersCollection.doc(uid).collection('workouts').snapshots();
  String newTitle = 'Workout Title';
///////
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  late String uid;

  void addUser(String username) {
    usersCollection.doc(uid).set({
      'username': username,
    });
  }

  ///

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
    usersCollection.doc(uid).collection('workouts').doc().set({
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
    usersCollection.doc(uid).collection('workouts').doc(workoutID).set({
      'workout_name': workout.title,
      'category': workout.category,
      'exercise_array': dataArray,
    });
    notifyListeners();
  }

  void deleteWorkout(String workoutID) {
    usersCollection.doc(uid).collection('workouts').doc(workoutID).delete();
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
