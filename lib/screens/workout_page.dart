import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:training_app/constants.dart';
import 'package:training_app/screens/in_progress_page.dart';
import '../models/workout.dart';
import '../models/workouts_box_provider.dart';
import '../widgets/exercise_card_edit.dart';
import 'edit_workout_page.dart';

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
            Container(
              height: 35,
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: kMainColor,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.white),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 4),
                        blurRadius: 4,
                        spreadRadius: 2)
                  ]),
              child: Row(
                children: [
                  const Expanded(
                    child: Text('Category:',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white)),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: Center(
                          child: Text(
                        workout.category,
                        style: kCardTextDarkRegular,
                      )),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: workout.exerciseList.length,
                  itemBuilder: (context, index) {
                    final exerciseList = workout.exerciseList;
                    return ExerciseCard(
                      edit: false,
                      exercise: exerciseList[index],
                      color: kBlueAccent,
                    );
                  }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        animationCurve: Curves.easeInBack,
        animationDuration: const Duration(milliseconds: 400),
        backgroundColor: kMainColor,
        index: 1,
        color: kWhiteBackground,
        height: 60,
        onTap: (index) {
          index == 0
              ? Navigator.pop(context)
              : index == 1
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InProgressPage()),
                    )
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              EditWorkoutPage(index: workoutIndex)),
                    );
        },
        items: const [
          FaIcon(
            FontAwesomeIcons.angleLeft,
            size: 30.0,
            color: kMainColor,
          ),
          FaIcon(
            FontAwesomeIcons.play,
            size: 30.0,
            color: kMainColor,
          ),
          FaIcon(
            FontAwesomeIcons.edit,
            size: 30.0,
            color: kMainColor,
          )
        ],
      ),
    );
  }
}
