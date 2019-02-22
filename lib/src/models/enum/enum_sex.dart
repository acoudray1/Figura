enum Sex {
  FEMALE, MALE, OTHER,
}

final EnumValues<Sex> sexValues = EnumValues<Sex> (<String, Sex> {
    'FEMALE': Sex.FEMALE,
    'MALE': Sex.MALE,
    'OTHER': Sex.OTHER,
});
