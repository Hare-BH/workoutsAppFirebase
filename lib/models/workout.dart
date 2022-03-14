import 'package:hive/hive.dart';

import 'exercise.dart';

part 'workout.g.dart';

@HiveType(typeId: 1)
class Workout extends HiveObject {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late List<Exercise> exerciseList;

  @HiveField(2)
  late String category;

  Workout(this.title, this.category, this.exerciseList);
}
