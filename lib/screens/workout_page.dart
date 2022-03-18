import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:training_app/constants.dart';
import '../models/workout.dart';
import '../models/workouts_box_provider.dart';
import '../widgets/category_bar.dart';
import '../widgets/exercise_builder.dart';
import '../widgets/navbar_workout.dart';

class WorkoutPage extends StatelessWidget {
  const WorkoutPage({Key? key, required this.workoutIndex}) : super(key: key);

  final int workoutIndex;

  @override
  Widget build(BuildContext context) {
    Workout workout = Provider.of<WorkoutsBoxProvider>(context)
        .workoutsBox
        .getAt(workoutIndex);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      backgroundColor: kMainColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                workout.title,
                style: kCardText,
              ),
            ),
            CategoryBar(category: workout.category),
            ExerciseBuilder(exercises: workout.exerciseList),
          ],
        ),
      ),
      bottomNavigationBar: NavBarWorkout(workoutIndex: workoutIndex),
    );
  }
}
