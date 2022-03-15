import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:training_app/constants.dart';
import 'package:training_app/models/category.dart';
import 'package:training_app/models/category_provider.dart';
import 'package:training_app/screens/workout_page.dart';
import '../models/workouts_box_provider.dart';
import '../widgets/calender_card.dart';
import '../widgets/category_buttons_nav.dart';
import '../widgets/next_workout_card.dart';
import '../widgets/workout_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Category> categories =
        Provider.of<CategoriesProvider>(context).categories;
    String activeCategory =
        Provider.of<CategoriesProvider>(context).activeCategory;
    Box workoutsBox = Provider.of<WorkoutsBoxProvider>(context).workoutsBox;

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
                style: kHeaderText,
              ),
            ),
            CategoryButtons(categories: categories),
            WorkoutCards(
                workoutsBox: workoutsBox, activeCategory: activeCategory),
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
                          onLongPress: () {
                            Provider.of<WorkoutsBoxProvider>(context,
                                    listen: false)
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
}

class WorkoutCards extends StatelessWidget {
  const WorkoutCards({
    Key? key,
    required this.workoutsBox,
    required this.activeCategory,
  }) : super(key: key);

  final Box workoutsBox;
  final String activeCategory;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: ListView.builder(
          physics: const ScrollPhysics(
              parent: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics())),
          scrollDirection: Axis.horizontal,
          itemCount: workoutsBox.length,
          itemBuilder: (context, index) {
            final workout = workoutsBox.getAt(index);
            if (activeCategory == 'All') {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WorkoutPage(workoutIndex: index)),
                  );
                },
                child: WorkoutCard(
                  title: workout.title,
                  category: workout.category,
                ),
              );
            } else {
              if (workout.category == activeCategory) {
                return WorkoutCard(
                  title: workout.title,
                  category: workout.category,
                );
              } else {
                return Container();
              }
            }
          }),
    );
  }
}
