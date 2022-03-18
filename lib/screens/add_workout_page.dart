import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:training_app/constants.dart';
import 'package:training_app/widgets/exercise_builder.dart';
import '../widgets/build_category_items.dart';
import '../widgets/fab_add_workout.dart';
import '../widgets/input_title_field.dart';

class AddWorkoutPage extends StatelessWidget {
  const AddWorkoutPage({Key? key}) : super(key: key);

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
      floatingActionButton: const FABAddWorkout(),
    );
  }
}
