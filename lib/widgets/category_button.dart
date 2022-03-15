import 'package:flutter/material.dart';
import 'package:training_app/constants.dart';

import '../models/category.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({Key? key, required this.category}) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        color: category.isPressed ? kMainColor : kWhiteBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: kElevatedShadow,
      ),
      child: Text(
        category.title,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: category.isPressed ? kWhiteBackground : kGrey,
            fontSize: 20,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
