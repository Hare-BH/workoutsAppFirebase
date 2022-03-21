import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:training_app/models/navigation_key.dart';
import 'package:training_app/screens/home_page.dart';
import 'package:training_app/screens/add_workout_page.dart';
import 'constants.dart';

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
          animationCurve: Curves.easeInBack,
          animationDuration: const Duration(milliseconds: 400),
          backgroundColor: color,
          color: main,
          height: 60,
          onTap: (index) => setState(() {
                index == 2
                    ? {color = kMainColor, main = kWhiteBackground}
                    : {color = kWhiteBackground, main = kMainColor};
                this.index = index;
              }),
          items: [
            FaIcon(
              FontAwesomeIcons.home,
              size: 20.0,
              color: color,
            ),
            FaIcon(
              FontAwesomeIcons.search,
              size: 20.0,
              color: color,
            ),
            FaIcon(
              FontAwesomeIcons.plus,
              size: 20.0,
              color: color,
            ),
            FaIcon(
              FontAwesomeIcons.calendar,
              size: 20.0,
              color: color,
            ),
            FaIcon(
              FontAwesomeIcons.bookmark,
              size: 20.0,
              color: color,
            )
          ]),
    );
  }
}
