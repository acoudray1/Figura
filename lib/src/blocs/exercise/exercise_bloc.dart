import 'dart:async';
import 'package:figura/src/blocs/bloc_provider.dart';
import 'package:figura/src/models/exercise_model.dart';
import 'package:figura/src/ressources/repository.dart';
import 'package:rxdart/rxdart.dart';

enum ListState {ALL, BACK, CHEST, LEG, SHOULDERS, TRICEPS, BICEPS, NECK, SEARCH}

class ExerciseBloc implements BlocBase {
  final Repository _repository = Repository();
  final PublishSubject<List<Exercise>> _exercisesFetcher = PublishSubject<List<Exercise>>();
  final StreamController<ListState> _exercisesSelector = StreamController<ListState>();

  /// On observe la sortie du stream et on récupère les exercices qui en sortent
  /// 
  Observable<List<Exercise>> get allExercises => _exercisesFetcher.stream;
  Stream<ListState> get selectedExercises => _exercisesSelector.stream;
 
  /// On entre dans le stream les différentes valeurs de notre json
  /// 
  Future<List<Exercise>> fetchAllExercises() async {
    final List<Exercise> exercises = await _repository.fetchAllExercises();
    _exercisesFetcher.sink.add(exercises);
    return null;
  }

  void changeSelection(ListState s) {
    switch (s) {
      case ListState.ALL:
        _exercisesSelector.sink.add(ListState.ALL);
        break;
      case ListState.BACK:
        _exercisesSelector.sink.add(ListState.BACK);
        break;
      case ListState.CHEST:
        _exercisesSelector.sink.add(ListState.CHEST);
        break;
      case ListState.LEG:
        _exercisesSelector.sink.add(ListState.LEG);
        break;
      case ListState.SHOULDERS:
        _exercisesSelector.sink.add(ListState.SHOULDERS);
        break;
      case ListState.TRICEPS:
        _exercisesSelector.sink.add(ListState.TRICEPS);
        break;
      case ListState.BICEPS:
        _exercisesSelector.sink.add(ListState.BICEPS);
        break;
      case ListState.SEARCH:
        _exercisesSelector.sink.add(ListState.SEARCH);
        break;
      default:
        _exercisesSelector.sink.add(ListState.ALL);
        break;
    }
  }

  /// On dispose du controleur
  @override
  void dispose() {
    _exercisesFetcher?.close();
    _exercisesSelector?.close();
  }
}