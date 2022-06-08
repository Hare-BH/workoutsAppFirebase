import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:training_app/constants.dart';
import 'package:training_app/models/provider/workouts_firestore_provider.dart';
import 'package:training_app/widgets/workouts_list.dart';

class SharedWorkouts extends StatelessWidget {
  const SharedWorkouts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Shared Workouts',
          ),
        ),
        backgroundColor: kMainColor,
      ),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          child: StreamBuilder<QuerySnapshot>(
            stream: Provider.of<WorkoutsFirestoreProvider>(context)
                .snapshotsStreamShared,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: SpinKitCircle(
                    size: 140,
                    itemBuilder: (context, index) {
                      final colors = [Colors.white, kBlueAccent];
                      final color = colors[index % colors.length];

                      return DecoratedBox(
                          decoration: BoxDecoration(color: color));
                    },
                  ),
                );
              }
              final workouts = snapshot.data!.docs;

              return ListView.builder(
                physics: const ScrollPhysics(
                    parent: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics())),
                scrollDirection: Axis.vertical,
                itemCount: workouts.length,
                itemBuilder: (context, index) {
                  final workout = workouts[index];
                  final workoutEmail = workout.get('email');
                  final workoutTitle = workout.get('workout_name');
                  final workoutCategory = workout.get('category');
                  final workoutExercises = workout.get('exercise_array');
                  final workoutID = workout.id;

                  if (FirebaseAuth.instance.currentUser!.email ==
                      workoutEmail) {
                    return WorkoutTileOnTap(
                      workoutExercises: workoutExercises,
                      workoutTitle: workoutTitle,
                      workoutCategory: workoutCategory,
                      workoutID: workoutID,
                      isShared: true,
                    );
                  } else {
                    return Container();
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
