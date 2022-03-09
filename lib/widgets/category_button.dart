import 'package:flutter/material.dart';
import 'package:training_app/constants.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({required this.title, this.isPressed = false});

  final String title;
  final bool isPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        color: isPressed ? kMainColor : kWhiteBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: kElevatedShadow,
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: isPressed ? kWhiteBackground : kGrey,
            fontSize: 20,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
