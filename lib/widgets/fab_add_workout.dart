import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:training_app/models/category_provider.dart';
import 'package:training_app/models/exercises_provider.dart';
import 'package:training_app/models/workouts_box_provider.dart';
import '../constants.dart';
import '../models/navigation_key.dart';
import 'add_exercise.dart';

class FABAddWorkout extends StatelessWidget {
  const FABAddWorkout({
    Key? key,
  }) : super(key: key);

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
                .addWorkout(title, category, exerciseList);
            //Provider.of<ExercisesProvider>(context, listen: false).deleteAll();
            CurvedNavigationBarState navState =
                NavigationKey.getKey().currentState!;
            navState.setPage(0);
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
