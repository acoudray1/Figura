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
  // Initialisation de l'etat de la liste
  ListState listState = ListState.all;

  // Appel du repository depuis lequel on peut appeler les méthodes utilisées pour fetch des json
  final Repository _repository = Repository();
  
  // Creation de la variable dans laquelle on va stocker nos exercices
  List<Exercise> exercises = <Exercise>[];

  // On crée notre 'StreamController' qui est en fait un PublishSubject -> return un 'Observable' plutot qu'un stream et 
  // peut être écouté plusieurs fois. Presque equivalent à un StreamController en broadcast.
  final PublishSubject<List<Exercise>> _exercisesFetcher = PublishSubject<List<Exercise>>();
  
  // Observable du PublishSubject créés précédemment
  Observable<List<Exercise>> get listOfExercises => _exercisesFetcher.stream;
  
  /// Methode appelant la méthode 'fetchAllExercises' de repository afin d'envoyer dans le PublishSubject le résultat
  /// 
  Future<List<Exercise>> fetchAllExercises() async  {
    // on récupère nos data
    exercises = await _repository.fetchAllExercises();
    // on les envoies dans le StreamController qui nous les renverra en Stream
    _exercisesFetcher.add(exercises);
    return <Exercise>[];
  }

  /// Callback function pour le text field
  /// 
  void searchOperation(String searchText) {
    // Récupération des noms des exercices dans la variable '_list' afin de filtrer
    final List<String> _list = <String>[];
    for(int i = 0; i < exercises.length; i++){
      // Ajout des noms des exercices
      if(!_list.contains(exercises[i].name))
        _list.add(exercises[i].name);
    }

    final List<Exercise> _retExercises = <Exercise>[];

    // searchresult.clear();
    if (listState == ListState.search) {
      for (int i = 0; i < _list.length; i++) {
        final String data = _list[i];
        if (data.toLowerCase().contains(searchText.toLowerCase())) {
          int index; 
          for (int i = 0; i < exercises.length; i++) {
            exercises[i].nameIsTheSame(data) ? index = i : index = null;
            if(index != null) {
              _retExercises.add(exercises[index]);
            }
          }
        }
      }
      _exercisesFetcher.add(_retExercises);
    }
  }
  
  @override
  void dispose() {
    _exercisesFetcher.close();
  }

}
