import 'package:figura/src/models/enum/enum_values.dart';

enum TypeOfWorkout {
  PUSH, PULL, LEG, UPPER_BODY, LOWER_BODY, CHEST, BACK, SHOULDERS, ARMS, CARDIO, FULL_BODY, OTHER, 
}

final EnumValues<TypeOfWorkout> typeOfWorkoutValues = EnumValues<TypeOfWorkout>(<String, TypeOfWorkout> {
    'PUSH': TypeOfWorkout.PUSH,
    'PULL': TypeOfWorkout.PULL,
    'LEG': TypeOfWorkout.LEG,
    'UPPER_BODY': TypeOfWorkout.UPPER_BODY,
    'LOWER_BODY': TypeOfWorkout.LOWER_BODY,
    'CHEST': TypeOfWorkout.CHEST,
    'BACK': TypeOfWorkout.BACK,
    'SHOULDERS': TypeOfWorkout.SHOULDERS,
    'ARMS': TypeOfWorkout.ARMS,
    'CARDIO': TypeOfWorkout.CARDIO,
    'FULL_BODY': TypeOfWorkout.FULL_BODY,
    'OTHER': TypeOfWorkout.OTHER
});