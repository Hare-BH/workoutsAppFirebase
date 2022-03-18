import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:training_app/constants.dart';
import 'package:training_app/models/exercise.dart';
import 'package:training_app/models/exercises_provider.dart';

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({
    Key? key,
    required this.edit,
    required this.exercise,
    this.color = kMainColor,
  }) : super(key: key);

  final Color color;
  final Exercise exercise;
  final bool edit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.white, width: 2),
          boxShadow: const [
            BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 4),
                blurRadius: 4,
                spreadRadius: 2)
          ]),
      child: Row(
        children: [
          Expanded(
              child: Text(
            '  ${exercise.title}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          )),
          Expanded(
              child: Container(
            height: 60,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 5.0),
              child: Text(
                '${exercise.sets}x${exercise.reps}\nRest: ${exercise.rest}s',
                style: kCardTextDarkSmall,
              ),
            ),
          )),
          edit
              ? GestureDetector(
                  onTap: () {
                    Provider.of<ExercisesProvider>(context, listen: false)
                        .deleteExercise(exercise);
                  },
                  child: Container(
                    color: Colors.red,
                    height: 60,
                    width: 35,
                    child: const Center(
                      child: FaIcon(
                        FontAwesomeIcons.minus,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
