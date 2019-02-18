class EnumValues<T> {
  EnumValues(this.map);
  
  Map<String, T> map;
  Map<T, String> reverseMap;

  Map<T, String> get reverse {
      if (reverseMap == null) {
          reverseMap = map.map((String k, T v) => MapEntry<T, String>(v, k));
      }
      return reverseMap;
  }
}
