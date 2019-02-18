import 'package:figura/src/blocs/exercise/exercise_bloc.dart';
import 'package:flutter/material.dart';

class ExerciseList extends StatefulWidget {

  @override
  _ExerciseListState createState() => _ExerciseListState();
}

class _ExerciseListState extends State<ExerciseList> {

  @override
  void initState() {
    super.initState();
    final ExerciseBloc exerciseBloc = ExerciseBloc();
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }

}