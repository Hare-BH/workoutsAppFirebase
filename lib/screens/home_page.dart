import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:training_app/constants.dart';
import 'package:training_app/models/workout.dart';
import '../models/workouts_box.dart';
import '../widgets/calender_card.dart';
import '../widgets/category_button.dart';
import '../widgets/next_workout_card.dart';
import '../widgets/workout_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  final bool pressed = false;

  final buttons = const [
    Padding(
      padding: EdgeInsets.only(left: 20),
      child: CategoryButton(
        title: 'Arms',
        isPressed: true,
      ),
    ),
    CategoryButton(title: 'Chest'),
    CategoryButton(title: 'Abs'),
    CategoryButton(title: 'Back'),
    CategoryButton(title: 'Shoulders')
  ];

  @override
  Widget build(BuildContext context) {
    Box workoutsBox = Provider.of<WorkoutsBox>(context).workoutsBox;
    return Scaffold(
      backgroundColor: kWhiteBackground,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Text(
                'Ready for a \nworkout?',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: kGrey, fontSize: 36, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 40,
              child: buildButtons(),
            ),
            SizedBox(
              height: 190,
              child: buildWorkoutCards(workoutsBox),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 30, left: 30, bottom: 20),
                width: MediaQuery.of(context).size.width - 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(child: NextWorkoutCard()),
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            print('sss');
                            Provider.of<WorkoutsBox>(context, listen: false)
                                .deleteAll();
                          },
                          child: const CalenderCard()),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView buildWorkoutCards(Box<dynamic> workoutsBox) {
    return ListView.builder(
        physics: const ScrollPhysics(
            parent:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics())),
        scrollDirection: Axis.horizontal,
        itemCount: workoutsBox.length,
        itemBuilder: (context, index) {
          if (workoutsBox.length == 0) {
            return const Center(child: Text('No workouts'));
          } else {
            return WorkoutCard(title: workoutsBox.getAt(index).title);
          }
        });
  }

  ListView buildButtons() {
    return ListView.builder(
        physics: const ScrollPhysics(
            parent:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics())),
        scrollDirection: Axis.horizontal,
        itemCount: buttons.length,
        itemBuilder: (context, index) {
          return buttons[index];
        });
  }
}
