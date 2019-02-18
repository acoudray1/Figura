import 'package:figura/src/models/enum/enum_values.dart';

enum Categories {
  ALL, BACK, CHEST, LEG, SHOULDERS, TRICEPS, BICEPS, NECK
}

final EnumValues<Categories> categoriesValues = EnumValues<Categories>({
    'BACK': Categories.BACK,
    'BICEPS': Categories.BICEPS,
    'CHEST': Categories.CHEST,
    'LEG': Categories.LEG,
    'SHOULDERS': Categories.SHOULDERS,
    'TRICEPS': Categories.TRICEPS,
    'NECK':Categories.NECK
});