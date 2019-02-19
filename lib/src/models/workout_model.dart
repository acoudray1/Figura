import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:muscle/general/enum/enum_feedback.dart';
import 'package:muscle/general/enum/enum_type_of_workout.dart';
import 'package:muscle/workout/controlleur/class_routine.dart';

// TODO: Ajouter la possibilité d'écrire son propre type de workout dans son fichier json (par user) -> newTypeOfWorkout(String str)

/// Method used to get a json file and write it inside a String, then write this string inside a list of workout and returns it
///
/// @param : (String) Path of the json file (The json file must be added to the pubspec.yaml)
/// @return Future<List<Workout>>
///
Future<List<Workout>> fetchWorkouts(String path) async {
  final String response = await rootBundle.loadString(path);

  // Use the compute function to run parsePhotos in a separate isolate
  return workoutFromJson(response);
}

/// Method used to parse a json file string and return a list of workout
/// 
/// @param : String of a json file
/// @return : List<Workout>
///
List<Workout> workoutFromJson(String str) {
    final dynamic jsonData = json.decode(str);
    return List<Workout>.from(jsonData.map((dynamic x) => Workout.fromJson(x)));
}

/// Method used to write a workout as a json 
///
/// @param : List<Workout>
/// @return : json
///
String workoutToJson(List<Workout> data) {
    final List<dynamic> dyn = List<dynamic>.from(data.map<dynamic>((dynamic x) => x.toJson()));
    return json.encode(dyn);
}

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
  Map<String, dynamic> toJson() => {
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
