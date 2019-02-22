
/// User class
///
/// @attribute (String) userFirstname
/// @attribute (String) userLastname
/// @attribute (int) age
/// @attribute (int) workoutPerWeekGoal
/// @attribute (List<Map<String, double>>) measures
/// @attribute (List<Map<String, double>>) measuresGoal
///
class User {
    User({
        this.userFirstname,
        this.userLastname,
        this.sex,
        this.age,
        this.workoutPerWeekGoal,
        this.measures,
        this.measuresGoal,
    });
    
    /// Creates an instance of User from a Json
    /// 
    factory User.fromJson(Map<String, dynamic> json) => new User(
        userFirstname: json["user_firstname"],
        userLastname: json["user_lastname"],
        sex: sexValues.map[json['SexValues']],
        age: json["age"],
        workoutPerWeekGoal: json["workout_per_week_goal"],
        measures: List<Map<String, double>>.from(json["measures"].map((x) => Map.from(x).map((k, v) => MapEntry<String, double>(k, v.toDouble())))),
        measuresGoal: List<Map<String, double>>.from(json["measures_goal"].map((x) => Map.from(x).map((k, v) => MapEntry<String, double>(k, v.toDouble())))),
    );
    
    String userFirstname;
    String userLastname;
    Sex sex;
    int age;
    int workoutPerWeekGoal;
    List<Map<String, double>> measures;
    List<Map<String, double>> measuresGoal;
    
    /// Write in a Json files
    /// 
    Map<String, dynamic> toJson() => {
        "user_firstname": userFirstname,
        "user_lastname": userLastname,
        "Sex": sexValues.reverse[sex],
        "age": age,
        "workout_per_week_goal": workoutPerWeekGoal,
        "measures": List<dynamic>.from(measures.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
        "measures_goal": List<dynamic>.from(measuresGoal.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    };
}
