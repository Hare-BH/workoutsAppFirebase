import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../models/provider/workouts_firestore_provider.dart';

class WorkoutDoneCard extends StatelessWidget {
  const WorkoutDoneCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        color: kMainColor,
        child: Container(
          decoration: BoxDecoration(
            color: kBlueAccent,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Workout Finished\nGreat Job',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  fontSize: 27,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<WorkoutsFirestoreProvider>(context, listen: false)
                      .resetExerciseIndex();
                  Provider.of<WorkoutsFirestoreProvider>(context, listen: false)
                      .doneWorkoutFalse();
                  Navigator.pop(context);
                },
                child: const CircleAvatar(
                  radius: 30,
                  child: FaIcon(
                    FontAwesomeIcons.home,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              const Text(
                '¨Look in the mirror.\nThat’s your competition.¨ – John Assaraf',
                textAlign: TextAlign.center,
                style: kQuoteStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
