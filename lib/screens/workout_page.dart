import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:training_app/constants.dart';
import 'package:training_app/models/exercise.dart';
import '../models/provider/workouts_firestore_provider.dart';
import '../widgets/category_bar.dart';
import '../widgets/exercise_builder.dart';
import '../widgets/navbar_workout.dart';

class WorkoutPage extends StatelessWidget {
  const WorkoutPage({
    Key? key,
    required this.workoutID,
  }) : super(key: key);

  final String workoutID;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    CollectionReference workouts =
        Provider.of<WorkoutsFirestoreProvider>(context).collectionRef;

    return FutureBuilder<DocumentSnapshot>(
      future: workouts.doc(workoutID).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          List<Exercise> exercises = [];
          for (var x in data['exercise_array']!) {
            final String title = x['exercise_name'];
            final int sets = x['sets'];
            final int reps = x['reps'];
            final int rest = x['rest'];
            exercises.add(Exercise(title, sets, reps, rest));
          }
          return Scaffold(
            backgroundColor: kMainColor,
            body: Padding(
              padding:
                  const EdgeInsets.only(left: 25.0, right: 25.0, top: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      data['workout_name'],
                      style: kCardText,
                    ),
                  ),
                  CategoryBar(category: data['category']),
                  ExerciseBuilder(exercises: exercises),
                ],
              ),
            ),
            bottomNavigationBar: NavBarWorkout(
              workoutTitle: data['workout_name'],
              exercises: exercises,
              category: data['category'],
              workoutID: workoutID,
            ),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
