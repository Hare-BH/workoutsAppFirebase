import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:training_app/constants.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: index,
      animationDuration: const Duration(milliseconds: 400),
      backgroundColor: kMainColor,
      height: 60,
      items: [
        FaIcon(
          FontAwesomeIcons.home,
          size: 20.0,
          color: kMainColor,
        ),
        FaIcon(
          FontAwesomeIcons.search,
          size: 20.0,
          color: kMainColor,
        ),
        FaIcon(
          FontAwesomeIcons.plus,
          size: 20.0,
          color: kMainColor,
        ),
        FaIcon(
          FontAwesomeIcons.calendar,
          size: 20.0,
          color: kMainColor,
        ),
        FaIcon(
          FontAwesomeIcons.bookmark,
          size: 20.0,
          color: kMainColor,
        )
      ],
    );
  }
}
