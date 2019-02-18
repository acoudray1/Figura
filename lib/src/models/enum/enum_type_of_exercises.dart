import 'package:figura/src/models/enum/enum_values.dart';

enum TypeOfExercise {
  BARBELL, DUMBELL, MACHINE, BODYWEIGHT, LOADED, ASSISTED, CABLE,
}

final EnumValues<TypeOfExercise> typeOfExerciseValues = EnumValues<TypeOfExercise>({
    'ASSISTED': TypeOfExercise.ASSISTED,
    'BARBELL': TypeOfExercise.BARBELL,
    'BODYWEIGHT': TypeOfExercise.BODYWEIGHT,
    'CABLE': TypeOfExercise.CABLE,
    'DUMBELL': TypeOfExercise.DUMBELL,
    'LOADED': TypeOfExercise.LOADED,
    'MACHINE': TypeOfExercise.MACHINE
});