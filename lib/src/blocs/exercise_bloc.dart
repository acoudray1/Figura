import 'package:figura/src/models/exercise_model.dart';
import 'package:figura/src/ressources/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:figura/src/blocs/bloc_provider.dart';

/// Différents State d'affichage de la liste d'exercice
/// 
enum ListState {
  all, search,
}

class ExerciseBloc extends BlocBase {

  // Appel du repository depuis lequel on peut appeler les méthodes utilisées pour fetch des json
  final Repository _repository = Repository();
  
  // On crée notre 'StreamController' qui est en fait un PublishSubject -> return un 'Observable' plutot qu'un stream et 
  // peut être écouté plusieurs fois. Presque equivalent à un StreamController en broadcast.
  final PublishSubject<List<Exercise>> _exercisesFetcher = PublishSubject<List<Exercise>>();
  
  // Observable du PublishSubject créés précédemment
  Observable<List<Exercise>> get listOfExercises => _exercisesFetcher.stream;
  
  // Methode appelant la méthode 'fetchAllExercises' de repository afin d'envoyer dans le PublishSubject le résultat
  Future<List<Exercise>> fetchAllExercises() async  {
    // on récupère nos data
    final List<Exercise> exercises = await _repository.fetchAllExercises();
    // on les envoies dans le StreamController qui nous les renverra en Stream
    _exercisesFetcher.add(exercises);
    return <Exercise>[];
  }
  
  @override
  void dispose() {
    _exercisesFetcher.close();
  }

}
