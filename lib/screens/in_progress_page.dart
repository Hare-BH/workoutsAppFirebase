import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_app/constants.dart';
import 'package:training_app/models/provider/workouts_box_provider.dart';
import '../models/workout.dart';
import '../widgets/in_progress_bottom_card.dart';
import '../widgets/in_progress_exercise_builder.dart';
import '../widgets/workout_done_card.dart';

class InProgressPage extends StatelessWidget {
  const InProgressPage({Key? key, required this.workoutIndex})
      : super(key: key);

  final int workoutIndex;

  @override
  Widget build(BuildContext context) {
    Workout workout =
        Provider.of<WorkoutsBoxProvider>(context).getAtIndex(workoutIndex);
    int exerciseIndex =
        Provider.of<WorkoutsBoxProvider>(context).exerciseInProgressIndex;
    bool isWorkoutDone = Provider.of<WorkoutsBoxProvider>(context).doneWorkout;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Text(
              workout.title,
              textAlign: TextAlign.center,
              style: kInProgressTitleStyle,
            ),
          ),
          InProgressExerciseBuilder(index: workoutIndex),
          isWorkoutDone
              ? const WorkoutDoneCard()
              : InProgressBottomCard(
                  exercise: workout.exerciseList[exerciseIndex],
                  listLength: workout.exerciseList.length,
                ),
        ],
      ),
    );
  }
}
