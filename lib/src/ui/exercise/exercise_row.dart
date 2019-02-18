import 'package:figura/src/models/exercise_model.dart';
import 'package:figura/theme/text_style.dart';
import 'package:figura/utils/gradient_color_generator.dart';
import 'package:flutter/material.dart';

/// NOTE: This is the list of exercises 
/// 
SliverList buildList(List<Exercise> exercises) {
  
  return SliverList(
    delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
      
      return Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 10.0,
        ),
        child: Stack(
          children: <Widget>[
            ExerciseCard(exercise: exercises[index]),
            //ExerciseThumbnail(exercise.assetPath),
          ],
        ),
      );
    },
    childCount: exercises.length,
    ),
  );
}

// NOTE: Affichage de la carte
/// Card class for exercises row
///
/// @param (Duration) duration
/// @param (String) category
/// @param (bool) done
/// 
class ExerciseCard extends StatelessWidget {
  const ExerciseCard({Key key, this.exercise}) : super(key: key);

  final Exercise exercise;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      width: MediaQuery.of(context).size.width - 20,
      decoration: BoxDecoration(
        gradient: gradientGenerator(exercise.difficulty),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const <BoxShadow>[
          BoxShadow(  
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 1.0),
          ),
        ],
      ),
      child: ExerciseContent(exercise: exercise),
    );
  }
}


// NOTE: Contenu de la carte de l'exercice
/// Exercise's content class for exercises row
///
/// @param (Exercise) exercise
/// 
class ExerciseContent extends StatelessWidget {
  const ExerciseContent({Key key, this.exercise}) : super(key: key);

  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
      constraints: const BoxConstraints.expand(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('${exercise.name}',
            style: Style.subtitleTextStyle.copyWith(color: Colors.white), 
          )
        ],
      )
    );
  }
}