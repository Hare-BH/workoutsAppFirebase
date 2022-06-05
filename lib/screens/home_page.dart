import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:training_app/constants.dart';
import '../widgets/calender_card.dart';
import '../widgets/category_buttons_nav.dart';
import '../widgets/next_workout_card.dart';
import 'package:training_app/widgets/workouts_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteBackground,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Text(
                    'Ready for a \nworkout?',
                    textAlign: TextAlign.left,
                    style: kHeaderText,
                  ),
                ),
                MaterialButton(
                  onPressed: (() => FirebaseAuth.instance.signOut()),
                  color: kMainColor,
                  child: const Text(
                    'Sign Out',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            const CategoryButtons(),
            const WorkoutCards(),
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
    );
  }
}
