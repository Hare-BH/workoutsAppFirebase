import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:training_app/constants.dart';
import '../widgets/exercise_inprogress.dart';

class InProgressPage extends StatefulWidget {
  const InProgressPage({Key? key}) : super(key: key);

  @override
  State<InProgressPage> createState() => _InProgressPageState();
}

const exercises = [
  ExerciseInProgress(cardState: false),
  ExerciseInProgress(cardState: false),
  ExerciseInProgress(cardState: false),
  ExerciseInProgress(cardState: true),
  ExerciseInProgress(),
  ExerciseInProgress(),
];

class _InProgressPageState extends State<InProgressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Text(
              'Arms - Intermidiate',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: kMainColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: kMainColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 25, top: 15, right: 25),
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: exercises.length,
                    itemBuilder: (context, index) {
                      return exercises[index];
                    }),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: kMainColor,
              child: Container(
                decoration: BoxDecoration(
                  color: kBlueAccent,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Curl',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w500,
                          shadows: [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 4),
                                blurRadius: 2,
                                spreadRadius: 1)
                          ]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: null,
                          child: const FaIcon(
                            FontAwesomeIcons.angleLeft,
                            size: 35,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          '3x15',
                          style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: null,
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
          ),
        ],
      ),
    );
  }
}
