import 'package:figura/src/models/enum/enum_feedback.dart';
import 'package:figura/src/models/enum/enum_type_of_workout.dart';
import 'package:figura/src/models/routine_model.dart';

// TODO: Ajouter la possibilité d'écrire son propre type de workout dans son fichier json (par user) -> newTypeOfWorkout(String str)
class Workout {

  Workout({this.routines, this.name, this.description, this.typeOfWorkout});

  /// Creates an instance of Workout from a Json
  /// 
  factory Workout.fromJson(Map<String, dynamic> json) => Workout(
      name: json['name'],
      description: json['description'],
      typeOfWorkout: typeOfWorkoutValues.map[json['Categories']],
      routines: List<Routine>.from(json['routines'].map((dynamic x) => Routine.fromJson(x))),
  );

  List<Workout> workouts;
  List<Routine> routines;
  String name;
  String description;
  TypeOfWorkout typeOfWorkout;
  Feedback feedback;
  Duration durationTotal;

  /// Write in a Json files
  /// 
  Map<String, dynamic> toJson() => <String, dynamic> {
      'name': name,
      'description': description,
      'typeOfWorkout': typeOfWorkoutValues.reverse[typeOfWorkout],
      'routines': List<dynamic>.from(routines.map<dynamic>((dynamic x) => x.toJson())),
  };

  /// Method that returns a resume of the routine as a String
  /// 
  /// @return String
  String getHistory() {
    String ret = '\n******* $name *******\n';
    if(workouts != null) {
      for(int i = 0; i < workouts.length; i++) {
        ret += workouts[i].getHistory();
      }
    }
    for(int i = 0; i < routines.length; i++) {
      ret += routines[i].getHistory();
    }
    return ret;
  }

  /// Method that return the number of rep done in a Workout
  /// 
  /// @return int
  int numberOfRep() {
    int ret;
    if(workouts != null) {
      for(int i = 0; i < workouts.length; i++) {
        ret += workouts[i].numberOfRep();
      } 
    }
    for(int i = 0; i < routines.length; i++) {
      ret += routines[i].numberOfRep();
    }
    return ret;
  }

  /// Method that returns the amout of rest time during a workout
  /// 
  /// @return Duration
  Duration restDuration() {
    Duration ret;
    if(workouts != null) {
      for(int i = 0; i < workouts.length; i++) {
        ret += workouts[i].restDuration();
      }
    }
    for(int i = 0; i < routines.length; i++) {
      ret += routines[i].restDuration();
    }
    return ret;
  }

  /// Method that returns the amount of weight lifted in a workout
  /// 
  /// @return double
  double amountOfWeight() {
    double ret;
    if(workouts != null) {
      for(int i = 0; i < workouts.length; i++) {
        ret += workouts[i].amountOfWeight();
      }
    }
    for(int i = 0; i < routines.length; i++) {
      ret += routines[i].amountOfWeight();
    }
    return ret;
  }

  /// Method that returns the total time in exercise (not in rest time) in a routine
  /// 
  /// @return Duration
  Duration workDuration() {
    Duration ret;
    if(workouts != null) {
      for(int i = 0; i < workouts.length; i++) {
        ret += workouts[i].workDuration();
      }
    }
    for(int i = 0; i < routines.length; i++) {
      ret += routines[i].workDuration();
    }
    return ret;
  }

  /// Method that returns the number of series done in a routine
  /// 
  /// @return int
  int numberOfSeries() {
    int ret;
    if(workouts != null) {
      for(int i = 0; i < workouts.length; i++) {
        ret += workouts[i].numberOfSeries();
      }
    }
    for(int i = 0; i < routines.length; i++) {
      ret += routines[i].numberOfSeries();
    }
    return ret;
  }

  /// Method that returns the different muscle that has been used in a workout as a List
  /// 
  /// @return List
  List<dynamic> recruitedMuscle() {
    List<dynamic> ret;
    if(workouts != null) {
      for(int i = 0; i < workouts.length; i++) {
        ret.add(workouts[i].recruitedMuscle());
      }
    }
    for(int i = 0; i < routines.length; i++) {
      ret.add(routines[i].recruitedMuscle());
    }
    return ret;
  }

}
