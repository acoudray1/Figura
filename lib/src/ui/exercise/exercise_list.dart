import 'package:figura/src/blocs/bloc_provider.dart';
//import 'package:figura/src/blocs/exercise/exercise_bloc.dart';
import 'package:figura/src/models/exercise_model.dart';
import 'package:figura/src/ui/exercise/exercise_row.dart';
import 'package:figura/theme/text_style.dart';
import 'package:flutter/material.dart';

class ExerciseList extends StatefulWidget {

  @override
  _ExerciseListState createState() => _ExerciseListState();
}

class _ExerciseListState extends State<ExerciseList> {
  
  List<Exercise> exercises = <Exercise>[];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // initialisation du bloc
    //final ExerciseBloc exerciseBloc = BlocProvider.of<ExerciseBloc>(context);

    return Scaffold(
      body: Container(height: 0, width: 0),
    );
  }
}