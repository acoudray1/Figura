import 'package:muscle/general/class_exercise.dart';
import 'package:muscle/general/enum/enum_categories.dart';
import 'package:muscle/general/enum/enum_sub_categories.dart';
import 'package:muscle/general/enum/enum_type_of_exercises.dart';

class ExercisePSerie{
  
  ExercisePSerie({
      this.name,
      this.typeOfExercise,
      this.categories,
      this.subCategories,
  });
  
  /// Creates an instance of ExercisePSerie from a Json
  /// 
  factory ExercisePSerie.fromJson(Map<String, dynamic> json) => ExercisePSerie(
      name: json['name'],
      typeOfExercise: typeOfExerciseValues.map[json['typeOfExercise']],
      categories: categoriesValues.map[json['Categories']],
      subCategories: List<SubCategories>.from(json['SubCategories'].map((dynamic x) => subCategoriesValues.map[x])),
  );

  /// Constructor used when you choose an exercise in the list of exercises
  /// 
  ExercisePSerie.fromExercise(Exercise exercise, TypeOfExercise type) {
    name = exercise.name;
    typeOfExercise = type;
    categories = exercise.categories;
    subCategories = exercise.subCategories;
  }
  
  String name;
  TypeOfExercise typeOfExercise;
  Categories categories;
  List<SubCategories> subCategories;

  int nombreDeRepetitions;
  double poids;
  Duration tempsDeTravail;

  /// Write in a Json files
  /// 
  Map<String, dynamic> toJson() => {
      'name': name,
      'typeOfExercise': typeOfExerciseValues.reverse[typeOfExercise],
      'Categories': categoriesValues.reverse[categories],
      'SubCategories': List<dynamic>.from(subCategories.map<dynamic>((dynamic x) => x)),
  };
}
