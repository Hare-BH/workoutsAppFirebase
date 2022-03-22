import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../models/provider/category_provider.dart';
import '../models/provider/exercises_provider.dart';
import '../models/provider/workouts_box_provider.dart';
import '../models/workout.dart';
import 'add_exercise.dart';

class FABUpdateWorkout extends StatelessWidget {
  const FABUpdateWorkout({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () {
            final title =
                Provider.of<WorkoutsBoxProvider>(context, listen: false)
                    .newTitle;
            final category =
                Provider.of<CategoriesProvider>(context, listen: false)
                    .selectedCategory;
            final exerciseList =
                Provider.of<ExercisesProvider>(context, listen: false)
                    .exercises;
            Provider.of<WorkoutsBoxProvider>(context, listen: false)
                .updateWorkout(Workout(title, category, exerciseList), index);
            Provider.of<ExercisesProvider>(context, listen: false).reset();
            Provider.of<WorkoutsBoxProvider>(context, listen: false)
                .resetFields();
            Provider.of<CategoriesProvider>(context, listen: false)
                .resetCategory();
            Navigator.pop(context);
          },
          backgroundColor: Colors.white,
          child: const FaIcon(
            FontAwesomeIcons.flagCheckered,
            color: kMainColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: FloatingActionButton(
            heroTag: 'fab2',
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: const AddExercise(),
                  ),
                ),
              );
            },
            backgroundColor: Colors.white,
            child: const FaIcon(
              FontAwesomeIcons.plus,
              color: kMainColor,
            ),
          ),
        ),
      ],
    );
  }
}
