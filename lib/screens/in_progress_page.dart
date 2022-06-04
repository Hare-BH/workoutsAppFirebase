import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_app/constants.dart';
import 'package:training_app/models/provider/workouts_firestore_provider.dart';
import '../models/exercise.dart';
import '../widgets/in_progress_bottom_card.dart';
import '../widgets/in_progress_exercise_builder.dart';
import '../widgets/workout_done_card.dart';

class InProgressPage extends StatelessWidget {
  const InProgressPage(
      {Key? key, required this.workoutTitle, required this.exercises})
      : super(key: key);

  final String workoutTitle;
  final List<Exercise> exercises;

  @override
  Widget build(BuildContext context) {
    int exerciseIndex =
        Provider.of<WorkoutsFirestoreProvider>(context).exerciseInProgressIndex;
    bool isWorkoutDone =
        Provider.of<WorkoutsFirestoreProvider>(context).doneWorkout;
    // CollectionReference workouts =
    //     Provider.of<WorkoutsFirestoreProvider>(context).collectionRef;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Text(
              workoutTitle,
              textAlign: TextAlign.center,
              style: kInProgressTitleStyle,
            ),
          ),
          InProgressExerciseBuilder(exercises: exercises),
          isWorkoutDone
              ? const WorkoutDoneCard()
              : InProgressBottomCard(
                  exercise: exercises[exerciseIndex],
                  listLength: exercises.length,
                ),
        ],
      ),
    );
  }
}
//     return FutureBuilder<DocumentSnapshot>(
//       future: workouts.doc(workoutID).get(),
//       builder: ((context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           Map<String, dynamic> data =
//               snapshot.data!.data() as Map<String, dynamic>;
//           List<Exercise> exercises = [];
//           for (var x in data['exercise_array']!) {
//             final String title = x['exercise_name'];
//             final int sets = x['sets'];
//             final int reps = x['reps'];
//             final int rest = x['rest'];
//             exercises.add(Exercise(title, sets, reps, rest));
//           }
//           return Scaffold(
//             backgroundColor: Colors.white,
//             body: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 40),
//                   child: Text(
//                     workoutID,
//                     textAlign: TextAlign.center,
//                     style: kInProgressTitleStyle,
//                   ),
//                 ),
//                 InProgressExerciseBuilder(exercises: exercises),
//                 isWorkoutDone
//                     ? const WorkoutDoneCard()
//                     : InProgressBottomCard(
//                         exercise: exercises[exerciseIndex],
//                         listLength: exercises.length,
//                       ),
//               ],
//             ),
//           );
//         } else {
//           return Container();
//         }
//       }),
//     );
//   }
// }
