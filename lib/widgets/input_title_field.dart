import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_app/models/provider/workouts_firestore_provider.dart';

import '../constants.dart';

class InputTitleField extends StatelessWidget {
  const InputTitleField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String wrkTitle =
        Provider.of<WorkoutsFirestoreProvider>(context, listen: false).newTitle;
    return Container(
      height: 40,
      margin: const EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: kMainColor, width: 2),
      ),
      child: TextField(
        onChanged: (value) {
          Provider.of<WorkoutsFirestoreProvider>(context, listen: false)
              .newTitle = value;
        },
        cursorColor: kMainColor,
        textAlign: TextAlign.center,
        style: const TextStyle(color: kMainColor, fontSize: 16.0),
        decoration: InputDecoration(
          hintText: wrkTitle,
          hintStyle: const TextStyle(color: Colors.black26, fontSize: 16),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
