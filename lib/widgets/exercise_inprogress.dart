import 'package:flutter/material.dart';
import 'package:training_app/constants.dart';

class ExerciseInProgress extends StatelessWidget {
  const ExerciseInProgress({
    Key? key,
    this.cardState,
  }) : super(key: key);

  final bool? cardState;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: kMainColor,
          border: Border.all(
              color: cardState == null
                  ? Colors.white
                  : cardState!
                      ? kGreen
                      : Colors.white,
              width: 2),
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 2,
              spreadRadius: 1,
            ),
          ]),
      child: Row(
        children: [
          const Expanded(
              child: Text(
            '  Curls',
            style: TextStyle(color: Colors.white),
          )),
          Expanded(
            child: Container(
              height: 35,
              color: cardState == false ? kMainColor : kBlueAccent,
              child: const Center(
                child: Text(
                  '  3x15    Rest: 60s',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
