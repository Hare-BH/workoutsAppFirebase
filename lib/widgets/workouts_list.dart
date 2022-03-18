import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:training_app/widgets/workout_card.dart';

import '../models/category_provider.dart';
import '../models/exercises_provider.dart';
import '../models/workouts_box_provider.dart';
import '../screens/workout_page.dart';

class WorkoutCards extends StatelessWidget {
  const WorkoutCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String activeCategory =
        Provider.of<CategoriesProvider>(context).activeCategory;
    Box workoutsBox = Provider.of<WorkoutsBoxProvider>(context).workoutsBox;
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
