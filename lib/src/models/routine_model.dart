import 'package:figura/src/models/serie_model.dart';

class Routine {
  Routine({List<Serie> series}) {
    series = series;
    name = series[0].exercisePSerie[0].name;
  }

  /// Creates an instance of Routine from a Json
  /// 
  factory Routine.fromJson(Map<String, dynamic> json) => Routine(
      series: List<Serie>.from(json['series'].map((dynamic x) => Serie.fromJson(x))),
  );

  List<Serie> series;
  String name;
  Duration duration;

  /// Write in a Json files
  /// 
  Map<String, dynamic> toJson() => <String, dynamic> {
      'series': List<dynamic>.from(series.map<dynamic>((dynamic x) => x.toJson())),
  };
  
  /// Method that returns a resume of the routine as a String
  /// 
  /// @return String
  String getHistory() {
    String ret = '\n*** $name ***\n';
    for(int i = 0; i < series.length; i++) {
      for(int j = 0; j < series[i].exercisePSerie.length; j++) {
        if(series[i].exercisePSerie[j].poids != null)
          ret += '${series[i].exercisePSerie[j].name} : ${series[i].exercisePSerie[j].nombreDeRepetitions} x ${series[i].exercisePSerie[j].poids}\n';
        else
          ret += '${series[i].exercisePSerie[j].name} : ${series[i].exercisePSerie[j].nombreDeRepetitions} en ${series[i].exercisePSerie[j].tempsDeTravail}\n';
      }
      ret += 'feedback : ${series[i].feedBack}\n';
    }
  return ret;
  }

  /// Method that return the number of rep done in a Routine
  /// 
  /// @return int
  int numberOfRep() {
    int ret;
    for(int i = 0; i < series.length; i++) {
      ret += series[i].numberOfRep();
    }
    return ret;
  }

  /// Method that returns the amout of rest time during a routine
  /// 
  /// @return Duration
  Duration restDuration() {
    Duration ret;
    for(int i = 0; i < series.length; i++) {
      ret += series[i].tempsDeRepos;
    }
    return ret;
  }

  /// Method that returns the amount of weight lifted in a routine
  /// 
  /// @return double
  double amountOfWeight() {
    double ret;
    for(int i = 0; i < series.length; i++) {
      ret += series[i].amountOfWeigth();
    }
    return ret;
  }

  /// Method that returns the total time in exercise (not in rest time) in a routine
  /// 
  /// @return Duration
  Duration workDuration() {
    Duration ret;
    for(int i = 0; i < series.length; i++) {
      ret += series[i].workDuration();
    }
    return ret;
  }

  /// Method that returns the number of series done in a routine
  /// 
  /// @return int
  int numberOfSeries() {
    return series.length;
  }

  /// Method that returns the different muscle that has been used as a String
  /// La forme sera : ret([(Categorie) cat, (int) difficuly 3], [(SubCategories) subCat,(int) difficuly 1]*)
  /// 
  /// @return List
  List<dynamic> recruitedMuscle() {
    List<dynamic> ret;
    for(int i = 0; i < series.length; i++) {
      for(int j = 0; j < series[i].exercisePSerie.length; j++) {
        if(series[i].exercisePSerie[j].categories != null) {
          ret.add(<dynamic>[series[i].exercisePSerie[j].categories, 3]);
        }
        if(series[i].exercisePSerie[j].subCategories != null) {
          for(int k = 0; k < series[i].exercisePSerie[j].subCategories.length; k++)
            ret.add(<dynamic>[series[i].exercisePSerie[j].subCategories[k], 1]);
        }
      }
    }
    return ret;
  }
}
