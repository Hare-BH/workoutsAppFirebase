import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:training_app/constants.dart';
import 'package:training_app/models/exercise.dart';
import 'package:training_app/models/exercises_provider.dart';
import 'package:training_app/models/navigation_key.dart';
import '../models/workout.dart';
import '../models/workouts_box_provider.dart';
import '../widgets/add_exercise.dart';
import '../widgets/exercise_card_edit.dart';

class AddWorkoutPage extends StatefulWidget {
  const AddWorkoutPage({Key? key}) : super(key: key);

  @override
  State<AddWorkoutPage> createState() => _AddWorkoutPageState();
}

final items = ['Abs', 'Arms', 'Chest', 'Back', 'Legs', 'Shoulders'];
Object? selected;
const bool edit = true;
late String title;
late String category;

class _AddWorkoutPageState extends State<AddWorkoutPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      backgroundColor: kMainColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  title = value;
                },
                cursorColor: kMainColor,
                textAlign: TextAlign.center,
                style: const TextStyle(color: kMainColor, fontSize: 16.0),
                decoration: const InputDecoration(
                  hintText: 'Workout title',
                  hintStyle: TextStyle(color: Colors.black26, fontSize: 16),
                  border: InputBorder.none,
                ),
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
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            value: selected,
                            icon: const FaIcon(
                              FontAwesomeIcons.angleDown,
                              color: kMainColor,
                            ),
                            items: items.map(buildMenuItem).toList(),
                            onChanged: (value) => setState(() {
                              selected = value;
                              category = value.toString();
                            }),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount:
                      Provider.of<ExercisesProvider>(context).exercises.length,
                  itemBuilder: (context, index) {
                    List<Exercise> exercises =
                        Provider.of<ExercisesProvider>(context).exercises;

                    return ExerciseCard(
                      edit: true,
                      exercise: exercises[index],
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Workout workout = Workout(
                  title,
                  category,
                  Provider.of<ExercisesProvider>(context, listen: false)
                      .exercises);
              Provider.of<WorkoutsBoxProvider>(context, listen: false)
                  .addWorkout(workout);
              Provider.of<ExercisesProvider>(context, listen: false)
                  .deleteAll();
              CurvedNavigationBarState navState =
                  NavigationKey.getKey().currentState!;
              navState.setPage(0);
            },
            backgroundColor: Colors.white,
            child: const FaIcon(
              FontAwesomeIcons.flagCheckered,
              color: kMainColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: const AddExercise(),
                    ),
                  ),
                );
              },
              backgroundColor: Colors.white,
              child: const FaIcon(
                FontAwesomeIcons.plus,
                color: kMainColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(
            color: kMainColor,
          ),
        ),
      );
}
