import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:training_app/auth.dart';
import 'package:training_app/main_page.dart';
import 'package:training_app/models/provider/category_provider.dart';
import 'package:training_app/models/provider/exercises_provider.dart';
import 'package:provider/provider.dart';
import 'package:training_app/screens/login_page.dart';
import 'models/provider/workouts_firestore_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ExercisesProvider()),
        ChangeNotifierProvider(create: (_) => WorkoutsFirestoreProvider()),
        ChangeNotifierProvider(create: (_) => CategoriesProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Raleway'),
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
            future: Firebase.initializeApp(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return StreamBuilder<User?>(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return const MainPage();
                    } else {
                      return const Auth();
                    }
                  },
                );
              } else {
                return const Scaffold();
              }
            }),
      ),
    );
  }
}


//https://github.com/Hare-BH/workouts_app.git
//workouts-app-721eb
