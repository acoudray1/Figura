
import 'package:figura/src/ressources/exercise_provider.dart';
import 'package:figura/src/models/exercise_model.dart';
import 'package:figura/src/ressources/workout_provider.dart';
import 'package:figura/src/models/workout_model.dart';
import 'package:figura/src/ressources/user_provider.dart';
import 'package:figura/src/models/user_model.dart';

/// This repository class is the central point from where the data will flow to BLOC
/// 
class Repository {

  final ExerciseProvider exerciseProvider = ExerciseProvider();
  final WorkoutProvider workoutProvider = WorkoutProvider();
  final UserProvider userProvider = UserProvider();

  Future<List<Exercise>> fetchAllExercises() => exerciseProvider.fetchExercises('assets/exercises.json');
  Future<List<Workout>> fetchAllWorkouts() => workoutProvider.fetchWorkouts('...');
  Future<User> fetchUser() => userProvider.fetchUser('...');
}
