import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:training_app/models/exercise.dart';
import '../constants.dart';
import '../models/provider/category_provider.dart';
import '../models/provider/exercises_provider.dart';
import '../models/provider/workouts_firestore_provider.dart';
import '../screens/edit_workout_page.dart';
import '../screens/in_progress_page.dart';

class NavBarWorkout extends StatelessWidget {
  const NavBarWorkout({
    Key? key,
    required this.workoutTitle,
    required this.exercises,
    required this.category,
    required this.workoutID,
  }) : super(key: key);

  final dynamic workoutID;
  final String workoutTitle;
  final String category;
  final List<Exercise> exercises;

  @override
  Widget build(BuildContext context) {
    late String email;
    return CurvedNavigationBar(
      animationCurve: Curves.easeInBack,
      animationDuration: const Duration(milliseconds: 400),
      backgroundColor: kMainColor,
      index: 1,
      color: kWhiteBackground,
      height: 60,
      onTap: (index) {
        //back
        if (index == 0) {
          Navigator.pop(context);
        }

        ///play
        if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => InProgressPage(
                      workoutTitle: workoutTitle,
                      exercises: exercises,
                    )),
          );
        }

        ///edit
        if (index == 2) {
          Provider.of<ExercisesProvider>(context, listen: false)
              .updateExercise(exercises);
          Provider.of<WorkoutsFirestoreProvider>(context, listen: false)
              .newTitle = workoutTitle;
          Provider.of<CategoriesProvider>(context, listen: false)
              .selectedCategory = category;
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditWorkoutPage(workoutID: workoutID)),
          );
        }
        ////share
        if (index == 3) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Share Workout'),
                  content: TextField(
                    onChanged: (value) => email = value,
                    decoration: const InputDecoration(
                      hintText: 'Enter user email',
                    ),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel')),
                    TextButton(
                        onPressed: () {
                          Provider.of<WorkoutsFirestoreProvider>(context,
                                  listen: false)
                              .shareWorkout(
                                  email, workoutTitle, category, exercises);
                          Navigator.pop(context);
                        },
                        child: const Text('Share')),
                  ],
                );
              });
        }
      },
      items: const [
        FaIcon(
          FontAwesomeIcons.angleLeft,
          size: 20.0,
          color: kMainColor,
        ),
        FaIcon(
          FontAwesomeIcons.play,
          size: 20.0,
          color: kMainColor,
        ),
        FaIcon(
          FontAwesomeIcons.edit,
          size: 20.0,
          color: kMainColor,
        ),
        FaIcon(
          FontAwesomeIcons.share,
          size: 20.0,
          color: kMainColor,
        )
      ],
    );
  }
}
