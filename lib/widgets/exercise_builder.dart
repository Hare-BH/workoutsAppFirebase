import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_app/models/exercise.dart';
import '../constants.dart';
import '../models/provider/exercises_provider.dart';
import 'exercise_card.dart';

class ExerciseBuilder extends StatelessWidget {
  const ExerciseBuilder({
    Key? key,
    this.exercises,
    this.edit = false,
  }) : super(key: key);

  final List<Exercise>? exercises;
  final bool edit;

  @override
  Widget build(BuildContext context) {
    List<Exercise> exerciseList;
    exercises == null
        ? exerciseList = Provider.of<ExercisesProvider>(context).exercises
        : exerciseList = exercises!;
    return Expanded(
      child: ListView.builder(
          itemCount: exerciseList.length,
          itemBuilder: (context, index) {
            return ExerciseCard(
              edit: edit,
              exercise: exerciseList[index],
              color: kBlueAccent,
            );
          }),
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   List<Exercise> exerciseList;
//   exercises == null
//       ? exerciseList = Provider.of<ExercisesProvider>(context).exercises
//       : exerciseList = exercises!;
//   return Expanded(
//     child: ListView.builder(
//         itemCount: exerciseList.length,
//         itemBuilder: (context, index) {
//           return ExerciseCard(
//             edit: edit,
//             exercise: exerciseList[index],
//             color: kBlueAccent,
//           );
//         }),
//   );
// }
