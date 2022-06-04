import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:training_app/widgets/rest_timer.dart';
import '../constants.dart';
import '../models/exercise.dart';
import '../models/provider/workouts_firestore_provider.dart';

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
    bool rest = Provider.of<WorkoutsFirestoreProvider>(context).rest;
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
                rest ? 'REST' : exercise.title,
                style: kInProgressExerciseStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (Provider.of<WorkoutsFirestoreProvider>(context,
                                  listen: false)
                              .exerciseInProgressIndex !=
                          0) {
                        Provider.of<WorkoutsFirestoreProvider>(context,
                                listen: false)
                            .decrementExerciseIndex();
                        Provider.of<WorkoutsFirestoreProvider>(context,
                                listen: false)
                            .restFalse();
                      } else {
                        Provider.of<WorkoutsFirestoreProvider>(context,
                                listen: false)
                            .doneWorkoutFalse();
                      }
                    },
                    child: const FaIcon(
                      FontAwesomeIcons.angleLeft,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                  rest
                      ? RestTimer(
                          seconds: exercise.rest,
                          listLength: listLength,
                        )
                      : Text(
                          '${exercise.sets}x${exercise.reps}',
                          style: kSetsRepsStyle,
                        ),
                  GestureDetector(
                    onTap: () {
                      Provider.of<WorkoutsFirestoreProvider>(context,
                              listen: false)
                          .restTrue();
                    },
                    onDoubleTap: () {
                      if (Provider.of<WorkoutsFirestoreProvider>(context,
                                  listen: false)
                              .exerciseInProgressIndex !=
                          listLength - 1) {
                        Provider.of<WorkoutsFirestoreProvider>(context,
                                listen: false)
                            .restFalse();
                        Provider.of<WorkoutsFirestoreProvider>(context,
                                listen: false)
                            .incrementExerciseIndex();
                      } else {
                        Provider.of<WorkoutsFirestoreProvider>(context,
                                listen: false)
                            .doneWorkoutTrue();
                        Provider.of<WorkoutsFirestoreProvider>(context,
                                listen: false)
                            .incrementExerciseIndex();
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
                  Provider.of<WorkoutsFirestoreProvider>(context, listen: false)
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
