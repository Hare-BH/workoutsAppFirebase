import 'package:hive/hive.dart';

part 'exercise.g.dart';

@HiveType(typeId: 2)
class Exercise extends HiveObject {
  @HiveField(0)
  late String title;
  @HiveField(1)
  late int sets;
  @HiveField(2)
  late int reps;
  @HiveField(3)
  late int rest;

  Exercise(this.title, this.sets, this.reps, this.rest);
}
