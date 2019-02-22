

enum Measures {
  WEIGHT, BODY_FAT_PERCENTAGE, SHOULDERS, LEFT_FOREARM, RIGHT_FOREARM, UPPER_ABS, LOWER_ABS, WAIST, 
  HIPS, LEFT_THIGH, RIGHT_THIGH, LEFT_CALF, RIGHT_CALF, LEFT_TRICEP, RIGHT_TRICEP, CHEST, LEFT_BICEP,
  RIGHT_BICEP, NECK,
}

final EnumValues<Measures> measuresValues = EnumValues<Measures> (<String, Measures> {
    'WEIGHT': Measures.WEIGHT, 
    'BODY_FAT_PERCENTAGE': Measures.BODY_FAT_PERCENTAGE, 
    'SHOULDERS': Measures.SHOULDERS, 
    'LEFT_FOREARM': Measures.LEFT_FOREARM, 
    'RIGHT_FOREARM': Measures.RIGHT_FOREARM, 
    'UPPER_ABS': Measures.UPPER_ABS, 
    'LOWER_ABS': Measures.LOWER_ABS, 
    'WAIST': Measures.WAIST, 
    'HIPS': Measures.HIPS, 
    'LEFT_THIGH': Measures.LEFT_THIGH, 
    'RIGHT_THIGH': Measures.RIGHT_THIGH, 
    'LEFT_CALF': Measures.LEFT_CALF, 
    'RIGHT_CALF': Measures.RIGHT_CALF, 
    'LEFT_TRICEP': Measures.LEFT_TRICEP, 
    'RIGHT_TRICEP': Measures.RIGHT_TRICEP, 
    'CHEST': Measures.CHEST, 
    'LEFT_BICEP': Measures.LEFT_BICEP,
    'RIGHT_BICEP': Measures.RIGHT_BICEP, 
    'NECK': Measures.NECK,
});
