import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:training_app/constants.dart';
import 'package:training_app/widgets/workout_card.dart';
import '../widgets/bottom_nav.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({Key? key}) : super(key: key);

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

final items = ['Abs', 'Arms', 'Chest', 'Back', 'Legs', 'Shoulders'];
Object? selected;

const exercises = [
  ExerciseCardEdit(),
  ExerciseCardEdit(),
  ExerciseCardEdit(),
  ExerciseCardEdit(),
];

class _WorkoutPageState extends State<WorkoutPage> {
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
              height: 35,
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
              child: const TextField(
                cursorColor: Colors.white,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
                decoration: InputDecoration(
                  hintText: 'New workout title',
                  hintStyle: TextStyle(
                    color: Colors.white54,
                    fontSize: 16,
                  ),
                  focusColor: Colors.white,
                  border: InputBorder.none,
                ),
              ),
            ), //title
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
                    child: Text(
                      'Category:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
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
                            icon: FaIcon(
                              FontAwesomeIcons.angleDown,
                              color: kMainColor,
                            ),
                            items: items.map(buildMenuItem).toList(),
                            onChanged: (value) => setState(() {
                              selected = value;
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
                  itemCount: exercises.length,
                  itemBuilder: (context, index) {
                    return exercises[index];
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.white,
        child: FaIcon(
          FontAwesomeIcons.checkDouble,
          color: kMainColor,
        ),
      ),
      bottomNavigationBar: const BottomNav(index: 2),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(
            color: kMainColor,
          ),
        ),
      );
}

class ExerciseCardEdit extends StatelessWidget {
  const ExerciseCardEdit({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          color: kMainColor,
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
          const Expanded(
              child: Text(
            '  Exercise Title',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          )),
          Expanded(
              child: Container(
            height: 60,
            color: Colors.white,
            child: Center(
              child: Text(
                '3x15\nRest: 60s',
                style: TextStyle(
                  color: kMainColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          )),
          Container(
            color: Colors.red,
            height: 60,
            width: 35,
            child: const Center(
              child: FaIcon(
                FontAwesomeIcons.minus,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
