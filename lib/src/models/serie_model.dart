import 'package:muscle/general/enum/enum_categories.dart';
import 'package:muscle/general/enum/enum_feedback.dart';
import 'package:muscle/workout/controlleur/class_exercisePSerie.dart';

class Serie {
  Serie({this.exercisePSerie});

  /// Creates an instance of Serie from a Json
  /// 
  factory Serie.fromJson(Map<String, dynamic> json) => Serie(
      exercisePSerie: List<ExercisePSerie>.from(json['exercisePSerie'].map((dynamic x) => ExercisePSerie.fromJson(x))),
  );

  List<ExercisePSerie> exercisePSerie;
  Duration tempsDeRepos;
  Feedback feedBack;

  /// Write in a Json files
  /// 
  Map<String, dynamic> toJson() => {
      'exercisePSerie': List<dynamic>.from(exercisePSerie.map<dynamic>((dynamic x) => x.toJson())),
  };
  
  /// Method that returns the number of rep done in a Serie
  /// 
  /// @return int
  int numberOfRep() {
    int ret;
    for(int i = 0; i < exercisePSerie.length; i++) {
      ret += exercisePSerie[i].nombreDeRepetitions;
    }
    return ret;
  }

  /// Method that returns the amount of weight lifted in a Serie
  /// 
  /// @return double
  double amountOfWeigth() {
    double ret; 
    for(int i = 0; i < exercisePSerie.length; i++) {
      ret += exercisePSerie[i].poids;
    }
    return ret;
  }

  /// Method that returns the approximative time that an exercise has been worked on
  ///
  /// @return Duration
  Duration workDuration() {
    Duration ret;
    for(int i = 0; i < exercisePSerie.length; i++) {
      if(exercisePSerie[i].tempsDeTravail != null)
        ret += exercisePSerie[i].tempsDeTravail;
      else {
        if(exercisePSerie[i].categories == Categories.BICEPS || exercisePSerie[i].categories == Categories.TRICEPS
          || exercisePSerie[i].categories == Categories.SHOULDERS) {
          ret += Duration(seconds: 2, milliseconds: 500);
        } else
          ret += Duration (seconds: 3, milliseconds: 500);
      }
    }
    return ret;
  }
}
