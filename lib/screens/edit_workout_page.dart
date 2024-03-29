import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:training_app/constants.dart';
import '../widgets/build_category_items.dart';
import '../widgets/exercise_builder.dart';
import '../widgets/fab_update_workout.dart';
import '../widgets/input_title_field.dart';

class EditWorkoutPage extends StatelessWidget {
  const EditWorkoutPage({Key? key, required this.workoutID}) : super(key: key);

  final String workoutID;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      backgroundColor: kMainColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            InputTitleField(),
            BuildCategoryItems(),
            ExerciseBuilder(edit: true),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FABUpdateWorkout(workoutID: workoutID),
    );
  }
}
