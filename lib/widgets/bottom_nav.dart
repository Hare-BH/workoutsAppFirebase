import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:training_app/constants.dart';

class BotomNav extends StatelessWidget {
  const BotomNav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: kWhiteBackground,
        borderRadius: BorderRadius.circular(30),
        boxShadow: kElevatedCardShadow,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FaIcon(
            FontAwesomeIcons.search,
            color: kMainColor,
            size: 30,
          ),
          FaIcon(
            FontAwesomeIcons.plus,
            color: kMainColor,
            size: 30,
          ),
          FaIcon(
            FontAwesomeIcons.bookmark,
            color: kMainColor,
            size: 30,
          ),
        ],
      ),
    );
  }
}
