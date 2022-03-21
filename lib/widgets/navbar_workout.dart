import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import '../screens/edit_workout_page.dart';
import '../screens/in_progress_page.dart';

class NavBarWorkout extends StatelessWidget {
  const NavBarWorkout({
    Key? key,
    required this.workoutIndex,
  }) : super(key: key);

  final int workoutIndex;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
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
                        builder: (context) =>
                            InProgressPage(workoutIndex: workoutIndex)),
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
    );
  }
}
