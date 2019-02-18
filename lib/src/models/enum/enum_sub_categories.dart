import 'package:figura/src/models/enum/enum_values.dart';

enum SubCategories {
  LATISSIMUS, RHOMBOIDS, FOREARMS, GLUTES, HAMSTRING, QUADRICEPS, BICEPS, SHOULDERS, TRICEPS,
}

final EnumValues<SubCategories> subCategoriesValues = EnumValues<SubCategories> ({
    'BICEPS': SubCategories.BICEPS,
    'FOREARMS': SubCategories.FOREARMS,
    'GLUTES': SubCategories.GLUTES,
    'HAMSTRING': SubCategories.HAMSTRING,
    'LATISSIMUS': SubCategories.LATISSIMUS,
    'QUADRICEPS': SubCategories.QUADRICEPS,
    'RHOMBOIDS': SubCategories.RHOMBOIDS,
    'SHOULDERS': SubCategories.SHOULDERS,
    'TRICEPS': SubCategories.TRICEPS
});