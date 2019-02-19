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
  // Creation du bloc controller 
  final ExerciseBloc exerciseBloc; 
  // Création de ma liste d'exercices à afficher
  List<Exercise> exercises = <Exercise>[];

  @override
  void initState() {
    super.initState();
    // initialisation du bloc 
    exerciseBloc = ExerciseBloc(); 
    // Appel de la méthode à l'initialisation de la page
    exerciseBloc.fetchAllExercises();
  }

  @override
  void dispose() {
    exerciseBloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider<ExerciseBloc>(
      bloc: exerciseBloc,
      child: StreamBuilder<List<Exercise>>(
        stream: exerciseBloc.allExercises,
        builder: (context, AsyncSnapshot<ItemModel> snapshot) {
          return Scaffold(
            body: CustomScrollView(
              slivers: <Widget>[
                buildSliverAppBar(IconData icon, '...' flexibleTitle, '...' appBarTitle);
                if(snapshot.hasError) {
                  return Text('An error occured, we apologize for this...'); 
                } else if(snapshot.hasData) {
                  // on stock les valeurs récupérées dans la variable 'exercises'
                  exercises = snapshot.data;
                  return buildList(exercises); 
                }
                return Center(child: CircularProgressIndicator());
              ],
            ),
          ),
        },
      ),
    );  
  }
}
