import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../exercise.dart';
import '../workout.dart';

class WorkoutsFirestoreProvider extends ChangeNotifier {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  String uid = 'notassigned';

  get collectionRef => usersCollection.doc(uid).collection('workouts');
  get snapshotsStream =>
      usersCollection.doc(uid).collection('workouts').snapshots();
  String newTitle = 'Workout Title';

  ///

  ///creates a new workout
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

  ///updates workout with new data
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

  ///deletes a workout
  void deleteWorkout(String workoutID) {
    usersCollection.doc(uid).collection('workouts').doc(workoutID).delete();
    notifyListeners();
  }

  ///shares a workout,
  get sharedCollectionRef =>
      FirebaseFirestore.instance.collection('shared_workouts');
  get snapshotsStreamShared => sharedCollectionRef.snapshots();
//adds it to collection of shared workouts
  void shareWorkout(
      String email, String title, String category, List<Exercise> exercises) {
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
    FirebaseFirestore.instance.collection('shared_workouts').doc().set({
      'email': email,
      'workout_name': title,
      'category': category,
      'exercise_array': dataArray,
    });
    notifyListeners();
  }

  ///////saving user id to load user data on restarting the app
  void saveUID(String id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userID', id);
  }

  ////seting uid to last known user
  void callUID() async {
    final prefs = await SharedPreferences.getInstance();
    uid = prefs.getString('userID')!;
    notifyListeners();
  }

  ///deleting uid upon signout
  void deleteUID() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userID', '');
  }

  ///active exercises
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
