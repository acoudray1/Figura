import 'dart:convert';
import 'package:figura/src/models/workout_model.dart';
import 'package:flutter/services.dart';

class WorkoutProvider {
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
}
