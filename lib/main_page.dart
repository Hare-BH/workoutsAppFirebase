import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:training_app/models/navigation_key.dart';
import 'package:training_app/screens/home_page.dart';
import 'package:training_app/screens/add_workout_page.dart';
import 'package:training_app/screens/login_page.dart';
import 'constants.dart';
import 'models/provider/workouts_firestore_provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final screens = [
    const HomePage(),
    const HomePage(),
    const AddWorkoutPage(),
    const HomePage(),
    const HomePage(),
  ];

  int index = 0;

  Color color = kWhiteBackground;
  Color main = kMainColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
          key: NavigationKey.getKey(),
          index: index,
          animationCurve: Curves.linearToEaseOut,
          animationDuration: const Duration(milliseconds: 400),
          backgroundColor: color,
          buttonBackgroundColor: main,
          color: color,
          height: 60,
          onTap: (index) => setState(() {
                index == 2
                    ? {color = kMainColor, main = kWhiteBackground}
                    : {color = kWhiteBackground, main = kMainColor};
                if (index == 4) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Sign Out'),
                          content:
                              const Text('Are you sure you want to sign out?'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancel')),
                            TextButton(
                                onPressed: () {
                                  FirebaseAuth.instance.signOut();
                                  Navigator.pop(context);
                                },
                                child: const Text('Sign Out')),
                          ],
                        );
                      });
                }
                this.index = index;
              }),
          items: [
            FaIcon(
              FontAwesomeIcons.home,
              size: 20.0,
              color: index == 0 ? color : main,
            ),
            FaIcon(
              FontAwesomeIcons.search,
              size: 20.0,
              color: index == 1 ? color : main,
            ),
            FaIcon(
              FontAwesomeIcons.plus,
              size: 20.0,
              color: index == 2 ? color : main,
            ),
            FaIcon(
              FontAwesomeIcons.calendar,
              size: 20.0,
              color: index == 3 ? color : main,
            ),
            FaIcon(
              FontAwesomeIcons.signOutAlt,
              size: 20.0,
              color: index == 4 ? color : main,
            )
          ]),
    );
  }
}
