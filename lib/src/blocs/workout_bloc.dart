import 'package:rxdart/rxdart.dart';
import 'package:figura/src/blocs/bloc_provider.dart';


class WorkoutBloc extends BlocBase {

  // Appel du repository depuis lequel on peut appeler les méthodes utilisées pour fetch des json
  final Repository _repository = Repository();
  
  // On crée notre 'StreamControler' qui est en fait un PublishSubject -> return un 'Observable' plutot qu'un stream et 
  // peut être écouté plusieurs fois. Presque equivalent à un StreamController en broadcast.
  final PublishSubject<List<Workout>> _workoutsFetcher = PublishSubject<List<Workout>>();
  
  // Observable du PublishSubject créés précédemment
  final Observable<List<Workout>> get allWorkouts => _workoutsFetcher.stream;
  
  // Methode appelant la méthode 'fetchAllWorkouts' de repository afin d'envoyer dans le PublishSubject le résultat
  Future<List<Workout>> fetchAllWorkouts() async  {
    // on récupère nos data
    List<Workout>> workouts = await _repository.fetchAllWorkouts();
    // on les envoies dans le StreamController qui nous les renverra en Stream
    _workoutssFetcher.add(workouts);
    return [];
  }
  
  @override
  void dispose() {
    _workoutsFetcher.close();
  }

}
