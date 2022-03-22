import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_app/widgets/workout_card.dart';

import '../models/provider/category_provider.dart';
import '../models/provider/workouts_box_provider.dart';
import '../screens/workout_page.dart';

class WorkoutCards extends StatelessWidget {
  const WorkoutCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutsBoxProvider>(
      builder: (BuildContext context, workoutsBox, _) {
        return SizedBox(
          height: 190,
          child: workoutsBox.boxLength() != 0
              ? ListView.builder(
                  physics: const ScrollPhysics(
                      parent: BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics())),
                  scrollDirection: Axis.horizontal,
                  itemCount: workoutsBox.boxLength(),
                  itemBuilder: (context, index) {
                    final workout = workoutsBox.getAtIndex(index);
                    if (Provider.of<CategoriesProvider>(context)
                            .activeCategory ==
                        'All') {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    WorkoutPage(workoutIndex: index)),
                          );
                        },
                        child: WorkoutCard(
                          title: workout.title,
                          category: workout.category,
                        ),
                      );
                    } else {
                      if (workout.category ==
                          Provider.of<CategoriesProvider>(context)
                              .activeCategory) {
                        return WorkoutCard(
                          title: workout.title,
                          category: workout.category,
                        );
                      } else {
                        return Container();
                      }
                    }
                  })
              : const Center(
                  child: Text(
                    'Press the plus button to \ncreate a new workout',
                    textAlign: TextAlign.center,
                  ),
                ),
        );
      },
    );
  }
}
