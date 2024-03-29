import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:training_app/constants.dart';
import 'package:training_app/models/provider/exercises_provider.dart';

class AddExercise extends StatelessWidget {
  const AddExercise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kMainColor,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'New Exercise',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                color: kMainColor,
              ),
            ),
            Container(
              height: 40,
              margin: const EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: kMainColor, width: 2),
              ),
              child: TextField(
                onChanged: (value) {
                  Provider.of<ExercisesProvider>(context, listen: false)
                      .newExerciseTitle = value;
                },
                cursorColor: kMainColor,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: kMainColor,
                  fontSize: 16.0,
                ),
                decoration: const InputDecoration(
                  hintText: 'Exercise title',
                  hintStyle: TextStyle(
                    color: Colors.black26,
                    fontSize: 16,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    margin: const EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: kMainColor, width: 2),
                    ),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        Provider.of<ExercisesProvider>(context, listen: false)
                            .newSets = int.parse(value);
                      },
                      cursorColor: kMainColor,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: kMainColor,
                        fontSize: 16.0,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Sets',
                        hintStyle: TextStyle(
                          color: Colors.black26,
                          fontSize: 16,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Container(
                    height: 40,
                    margin: const EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: kMainColor, width: 2),
                    ),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        Provider.of<ExercisesProvider>(context, listen: false)
                            .newReps = int.parse(value);
                      },
                      cursorColor: kMainColor,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: kMainColor,
                        fontSize: 16.0,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Reps',
                        hintStyle: TextStyle(
                          color: Colors.black26,
                          fontSize: 16,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Container(
                    height: 40,
                    margin: const EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: kMainColor, width: 2),
                    ),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        Provider.of<ExercisesProvider>(context, listen: false)
                            .newRest = int.parse(value);
                      },
                      cursorColor: kMainColor,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: kMainColor,
                        fontSize: 16.0,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Rest',
                        hintStyle: TextStyle(
                          color: Colors.black26,
                          fontSize: 16,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            MaterialButton(
              color: kMainColor,
              child: const Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Provider.of<ExercisesProvider>(context, listen: false)
                    .addExercise();
                SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                    overlays: []);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
