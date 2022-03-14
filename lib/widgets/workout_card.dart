import 'package:flutter/material.dart';
import 'package:training_app/constants.dart';
import 'package:invert_colors/invert_colors.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: MediaQuery.of(context).size.width - 100,
      margin: const EdgeInsets.only(left: 30, top: 5, bottom: 5),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: kMainColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: kElevatedCardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            textAlign: TextAlign.left,
            style: kCardText,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'May 12th \n2022',
                  style: kCardTextSmall,
                ),
              ),
              SizedBox(
                width: 70,
                height: 70,
                child: InvertColors(
                  child: Image.asset(
                    'images/biceps.png',
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
