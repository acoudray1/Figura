import 'package:figura/src/blocs/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class ApplicationBloc extends BlocBase{
  
  // Appel du repository depuis lequel on peut appeler les méthodes utilisées pour fetch des json
  final Repository _repository = Repository();
  
  // On crée nos deux 'StreamControler' qui sont en fait des PublishSubject -> return un 'Observable' plutot qu'un stream et 
  // peut être écouté plusieurs fois. Equivalent à un StreamController en broadcast.
  final PublishSubject<List<Exercise>> _exercisesFetcher = PublishSubject<List<Exercise>>();
  final PublishSubject<List<Workout>> _workoutsFetcher = PublishSubject<List<Workout>>();
  
  // Listener des PublishSubject créés précédemment
  final Observable<List<Exercise>> get allExercises => _exercisesFetcher.stream;
  final Observable<List<Workout>> get allWorkouts => _workoutsFetcher.stream;
  
  // Methodes appelant les différentes méthodes 'fetch' de repository afin d'envoyer dans le PublishSubject le résultat
  fetchAllExercises() async  {
    List<Exercise>> exercises = await _repository.fetchAllExercises();
    _exercisesFetcher.add(exercises);
  }
  
  fetchAllWorkouts() async  {
    List<Workout>> workouts = await _repository.fetchAllWorkouts();
    _workoutssFetcher.add(workouts);
  }
  
  
  @override
  void dispose() {
    // TODO: implement dispose
  }

}
