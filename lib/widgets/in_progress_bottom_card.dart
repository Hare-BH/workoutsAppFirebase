import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../models/exercise.dart';
import '../models/provider/workouts_box_provider.dart';

class InProgressBottomCard extends StatelessWidget {
  const InProgressBottomCard({
    Key? key,
    required this.exercise,
    required this.listLength,
  }) : super(key: key);

  final int listLength;
  final Exercise exercise;

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
              Text(
                exercise.title,
                style: kInProgressExerciseStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (Provider.of<WorkoutsBoxProvider>(context,
                                  listen: false)
                              .exerciseInProgressIndex !=
                          0) {
                        Provider.of<WorkoutsBoxProvider>(context, listen: false)
                            .decrementExerciseIndex();
                      } else {
                        ///
                      }
                    },
                    child: const FaIcon(
                      FontAwesomeIcons.angleLeft,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${exercise.sets}x${exercise.reps}',
                    style: kSetsRepsStyle,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (Provider.of<WorkoutsBoxProvider>(context,
                                  listen: false)
                              .exerciseInProgressIndex !=
                          listLength - 1) {
                        Provider.of<WorkoutsBoxProvider>(context, listen: false)
                            .incrementExerciseIndex();
                      } else {
                        ///
                      }
                    },
                    child: const FaIcon(
                      FontAwesomeIcons.angleRight,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Text(
                '¨Look in the mirror.\nThat’s your competition.¨ – John Assaraf',
                textAlign: TextAlign.center,
                style: kQuoteStyle,
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<WorkoutsBoxProvider>(context, listen: false)
                      .resetExerciseIndex();
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
            ],
          ),
        ),
      ),
    );
  }
}
