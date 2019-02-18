import 'package:figura/src/models/enum/enum_categories.dart';
import 'package:figura/src/models/enum/enum_sub_categories.dart';
import 'package:figura/src/models/enum/enum_type_of_exercises.dart';

/// Exercise class
///
/// @attribute (String) category
/// @attribute (List<ExerciseElement>) exerciseElements
///
class Exercise {
  Exercise({
      this.name,
      this.typeOfExercise,
      this.categories,
      this.subCategories,
      this.difficulty,
  });

  /// Creates an instance of Exercise from a Json
  /// 
  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
      name: json['name'],
      typeOfExercise: List<TypeOfExercise>.from(json['TypeOfExercise'].map((dynamic x) => typeOfExerciseValues.map[x])),
      categories: categoriesValues.map[json['Categories']],
      subCategories: List<SubCategories>.from(json['SubCategories'].map((dynamic x) => subCategoriesValues.map[x])),
      difficulty: json['difficulty'],
  );

  String name;
  List<TypeOfExercise> typeOfExercise;
  Categories categories;
  List<SubCategories> subCategories;
  int difficulty;
  TypeOfExercise actualExercise;

  /// Write in a Json files
  /// 
  Map<String, dynamic> toJson() => <String, dynamic> {
      'name': name,
      'TypeOfExercise': List<dynamic>.from(typeOfExercise.map<dynamic>((dynamic x) => typeOfExerciseValues.reverse[x])),
      'Categories': categoriesValues.reverse[categories],
      'SubCategories': List<dynamic>.from(subCategories.map<dynamic>((dynamic x) => subCategoriesValues.reverse[x])),
      'difficulty': difficulty,
  };

  /// Method to verify if a String is equal to the name of an exercise
  /// 
  /// @param (String)
  /// @return (Boolean)
  /// 
  bool nameIsTheSame(String data){
    if(data == name)
      return true;
    else 
      return false;
  }
}
