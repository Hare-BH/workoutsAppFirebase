import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../models/provider/workouts_box_provider.dart';

class RestTimer extends StatefulWidget {
  const RestTimer({Key? key, required this.seconds, required this.listLength})
      : super(key: key);

  final int seconds;
  final int listLength;

  @override
  State<RestTimer> createState() => _RestTimerState();
}

class _RestTimerState extends State<RestTimer> {
  late int _counter = widget.seconds;
  late Timer _timer;
  late int listLength = widget.listLength;

  void next() {
    if (Provider.of<WorkoutsBoxProvider>(context, listen: false)
            .exerciseInProgressIndex !=
        listLength - 1) {
      Provider.of<WorkoutsBoxProvider>(context, listen: false)
          .incrementExerciseIndex();
    } else {
      Provider.of<WorkoutsBoxProvider>(context, listen: false)
          .doneWorkoutTrue();
    }
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _counter > 0
            ? _counter--
            : {
                _timer.cancel(),
                Provider.of<WorkoutsBoxProvider>(context, listen: false)
                    .restFalse(),
                next()
              };
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_counter',
      style: kInProgressExerciseStyle,
    );
  }
}
