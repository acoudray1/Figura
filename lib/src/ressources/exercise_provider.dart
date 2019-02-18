import 'dart:convert';
import 'package:figura/src/models/exercise_model.dart';
import 'package:flutter/services.dart';

class ExerciseProvider {
  /// Method used to get a json file and write it inside a String, then write this string inside a list of exercises and returns it
  ///
  /// @param : (String) Path of the json file (The json file must be added to the pubspec.yaml)
  /// @return Future<List<Exercises>>
  ///
  Future<List<Exercise>> fetchExercises(String path) async {
    final String response = await rootBundle.loadString(path);

    // Use the compute function to run parsePhotos in a separate isolate
    return exerciseFromJson(response);
  }

  /// Method used to parse a json file string and return a list of exercises
  /// 
  /// @param : String of a json file
  /// @return : List<Exercise>
  ///
  List<Exercise> exerciseFromJson(String str) {
      final dynamic jsonData = json.decode(str);
      return List<Exercise>.from(jsonData.map((dynamic x) => Exercise.fromJson(x)));
  }

  /// Method used to write a json by using a list of exercises
  ///
  /// @param : List<Exercise>
  /// @return : String of a json file
  ///
  String exerciseToJson(List<Exercise> data) {
      final List<dynamic> dyn = List<dynamic>.from(data.map<dynamic>((dynamic x) => x.toJson()));
      return json.encode(dyn);
  }

}