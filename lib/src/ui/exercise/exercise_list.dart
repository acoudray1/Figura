import 'package:figura/src/blocs/bloc_provider.dart';
import 'package:figura/src/blocs/exercise_bloc.dart';
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
  ExerciseBloc exerciseBloc; 
  // Création de ma liste d'exercices à afficher
  List<Exercise> exercises = <Exercise>[];
  // Définition des variables utilisées pour la search bar
  final IconData _searchIcon = Icons.search;
  Widget _appBarTitle;
  final Text _flexibleTitle = Text('Exercises', style: Style.titleTextStyle, textAlign: TextAlign.center);
  final TextEditingController _textController = TextEditingController();
  
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
        builder: (BuildContext context, AsyncSnapshot<List<Exercise>> snapshot) {
          if(snapshot.hasError) {
            return const Text('An error occured, we apologize for this...'); 
          } else if(snapshot.hasData) {
            // on stock les valeurs récupérées dans la variable 'exercises'
            exercises = snapshot.data;
          return Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: const Color(0xFF333366),
            body: CustomScrollView(
              slivers: <Widget>[
                buildSliverAppBar(_searchIcon, _flexibleTitle, _appBarTitle, _textController),
                buildList(exercises), 
              ],
            ),
          );}
          return const Center(child: CircularProgressIndicator()
          );
        },
      ),
    );  
  }
  
  /// SliverAppBar Widget used in the exercise page
  ///
  SliverAppBar buildSliverAppBar(IconData icon, Text flexibleTitle, Widget appBarTitle, TextEditingController textController) {
    return SliverAppBar(
      expandedHeight: 200.0,
      centerTitle: true,
      title: appBarTitle,
      flexibleSpace: FlexibleSpaceBar(
        title: flexibleTitle,
        centerTitle: true,
        background: Image.asset('assets/images/exercise_page_sliver_app_bar.jpg',
          fit: BoxFit.cover,
          ),
        collapseMode: CollapseMode.parallax,
      ),
      pinned: true,
      /*actions: <Widget>[
        IconButton(
          icon: Icon(iconSearch),
          onPressed: () {
            setState(() {
              if(iconSearch == Icons.search) {
                iconSearch = Icons.close;
                flexibleTitle = null;
                appBarTitle = PreferredSize(
                  preferredSize: Size(MediaQuery.of(context).size.width - 100, 10),
                  child: TextField(
                    controller: textController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.white),
                      hintText: 'Search...',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    onChanged: searchOperation,
                  ),
                );
                handleSearchStart();
              } else
                handleSearchEnd();
            }); 
          },
        )
      ],*/
    ); 
  }
}
