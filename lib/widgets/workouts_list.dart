import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:training_app/widgets/workout_card.dart';
import '../constants.dart';
import '../models/exercise.dart';
import '../models/provider/category_provider.dart';
import '../models/provider/workouts_firestore_provider.dart';
import '../screens/workout_page.dart';

class WorkoutCards extends StatelessWidget {
  const WorkoutCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: StreamBuilder<QuerySnapshot>(
        stream: Provider.of<WorkoutsFirestoreProvider>(context).snapshotsStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: SpinKitCircle(
                size: 140,
                itemBuilder: (context, index) {
                  final colors = [Colors.white, kBlueAccent];
                  final color = colors[index % colors.length];

                  return DecoratedBox(decoration: BoxDecoration(color: color));
                },
              ),
            );
          }
          final workouts = snapshot.data!.docs;

          return ListView.builder(
              physics: const ScrollPhysics(
                  parent: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics())),
              scrollDirection: Axis.horizontal,
              itemCount: workouts.length,
              itemBuilder: (context, index) {
                final workout = workouts[index];
                final workoutTitle = workout.get('workout_name');
                final workoutCategory = workout.get('category');
                final workoutExercises = workout.get('exercise_array');
                final workoutID = workout.id;

                if (Provider.of<CategoriesProvider>(context).activeCategory ==
                    'All') {
                  return WorkoutTileOnTap(
                    workoutExercises: workoutExercises,
                    workoutTitle: workoutTitle,
                    workoutCategory: workoutCategory,
                    workoutID: workoutID,
                  );
                } else {
                  if (workoutCategory ==
                      Provider.of<CategoriesProvider>(context).activeCategory) {
                    return WorkoutTileOnTap(
                      workoutExercises: workoutExercises,
                      workoutTitle: workoutTitle,
                      workoutCategory: workoutCategory,
                      workoutID: workoutID,
                    );
                  } else {
                    return const Center(
                      child: Text('        No workouts'),
                    );
                  }
                }
              });
        },
      ),
    );
  }
}

class WorkoutTileOnTap extends StatelessWidget {
  const WorkoutTileOnTap({
    Key? key,
    required this.workoutExercises,
    required this.workoutTitle,
    required this.workoutCategory,
    required this.workoutID,
    this.isShared = false,
  }) : super(key: key);

  final dynamic workoutID;
  final dynamic workoutExercises;
  final dynamic workoutTitle;
  final dynamic workoutCategory;
  final bool isShared;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        List<Exercise> exercise = [];
        for (var x in workoutExercises!) {
          final String title = x['exercise_name'];
          final int sets = x['sets'];
          final int reps = x['reps'];
          final int rest = x['rest'];
          exercise.add(Exercise(title, sets, reps, rest));
        }
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WorkoutPage(
                    isShared: isShared,
                    workoutID: workoutID,
                  )),
        );
      },
      onLongPress: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text('Delete Workout!'),
                  content: Text(
                      'Are you sure you want to delete workout named "$workoutTitle"?'),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('CANCEL')),
                    TextButton(
                        onPressed: () {
                          Provider.of<WorkoutsFirestoreProvider>(context,
                                  listen: false)
                              .deleteWorkout(workoutID);
                          Navigator.pop(context);
                        },
                        child: const Text('DELETE')),
                  ],
                ));
      },
      child: WorkoutCard(
        title: workoutTitle,
        category: workoutCategory,
      ),
    );
  }
}
