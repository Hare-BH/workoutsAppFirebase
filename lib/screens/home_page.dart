import 'package:flutter/material.dart';
import 'package:training_app/constants.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/calender_card.dart';
import '../widgets/category_button.dart';
import '../widgets/next_workout_card.dart';
import '../widgets/workout_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _SetupScreenState createState() => _SetupScreenState();
}

class _SetupScreenState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool pressed = false;

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

  final workouts = [
    const WorkoutCard(),
    const WorkoutCard(),
    const WorkoutCard(),
    const WorkoutCard(),
  ];

  @override
  Widget build(BuildContext context) {
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
              child: ListView.builder(
                  physics: const ScrollPhysics(
                      parent: BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics())),
                  scrollDirection: Axis.horizontal,
                  itemCount: buttons.length,
                  itemBuilder: (context, index) {
                    return buttons[index];
                  }),
            ),
            SizedBox(
              height: 190,
              child: ListView.builder(
                  physics: const ScrollPhysics(
                      parent: BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics())),
                  scrollDirection: Axis.horizontal,
                  itemCount: workouts.length,
                  itemBuilder: (context, index) {
                    return workouts[index];
                  }),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 30, left: 30, bottom: 20),
                width: MediaQuery.of(context).size.width - 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Expanded(child: NextWorkoutCard()),
                    Expanded(child: CalenderCard()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNav(index: 0),
    );
  }
}
