import 'package:rxdart/rxdart.dart';
import 'package:figura/src/blocs/bloc_provider.dart';


class ExerciseBloc extends BlocBase {

  // Appel du repository depuis lequel on peut appeler les méthodes utilisées pour fetch des json
  final Repository _repository = Repository();
  
  // On crée notre 'StreamControler' qui est en fait un PublishSubject -> return un 'Observable' plutot qu'un stream et 
  // peut être écouté plusieurs fois. Presque equivalent à un StreamController en broadcast.
  final PublishSubject<List<Exercise>> _exercisesFetcher = PublishSubject<List<Exercise>>();
  
  // Observable du PublishSubject créés précédemment
  final Observable<List<Exercise>> get allExercises => _exercisesFetcher.stream;
  
  // Methode appelant la méthode 'fetchAllExercises' de repository afin d'envoyer dans le PublishSubject le résultat
  Future<List<Exercise>> fetchAllExercises() async  {
    // on récupère nos data
    List<Exercise>> exercises = await _repository.fetchAllExercises();
    // on les envoies dans le StreamController qui nous les renverra en Stream
    _exercisessFetcher.add(exercises);
    return [];
  }
  
  @override
  void dispose() {
    _exercisesFetcher.close();
  }

}
