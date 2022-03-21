import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../models/exercise.dart';
import '../models/provider/workouts_box_provider.dart';
import 'exercise_inprogress.dart';

class InProgressExerciseBuilder extends StatelessWidget {
  const InProgressExerciseBuilder({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    List<Exercise> exercises = Provider.of<WorkoutsBoxProvider>(context)
        .getAtIndex(index)
        .exerciseList;
    return Expanded(
      flex: 2,
      child: Container(
        decoration: const BoxDecoration(
          color: kMainColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 25, top: 15, right: 25),
          child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: exercises.length,
              itemBuilder: (context, index) {
                Exercise exercise = exercises[index];
                return ExerciseInProgress(
                  exercise: exercise,
                  exerIndex: index,
                );
              }),
        ),
      ),
    );
  }
}
