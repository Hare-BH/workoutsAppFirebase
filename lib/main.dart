import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:training_app/screens/home_page.dart';
import 'package:training_app/screens/workout_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Raleway'),
      debugShowCheckedModeBanner: false,
      home: const WorkoutPage(),
    );
  }
}
