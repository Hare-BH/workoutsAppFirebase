import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:training_app/main_page.dart';
import 'package:training_app/models/exercises_provider.dart';
import 'package:training_app/models/workout.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'models/exercise.dart';
import 'models/workouts_box.dart';

void main() async {
  Hive.registerAdapter(WorkoutAdapter());
  Hive.registerAdapter(ExerciseAdapter());
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // MultiProvider(providers: [
  //   ChangeNotifierProvider(create: (_) => ExercisesProv()),
  //   ChangeNotifierProvider(create: (_) => WorkoutsBox()),
  // ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ExercisesProv()),
        ChangeNotifierProvider(create: (_) => WorkoutsBox()),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Raleway'),
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
            future: Hive.openBox('workouts'),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return const MainPage();
              } else {
                return const Scaffold();
              }
            }),
      ),
    );
  }
}
