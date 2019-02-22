import 'dart:convert';


class UserProvider {
	/// Method used to get a json file and write it inside a String, then write this string inside a list of exercises and returns it
  ///
  /// @param : (String) Path of the json file (The json file must be added to the pubspec.yaml)
  /// @return Future<User>
  ///
  Future<User> fetchExercises(String path) async {
    final String response = await rootBundle.loadString(path);

    // Use the compute function to run parsePhotos in a separate isolate
    return userFromJson(response);
	}
	
	/// Method used to parse a json file string and return a list of exercises
  /// 
  /// @param : String of a json file
  /// @return : User
	///
	User userFromJson(String str) {
			final jsonData = json.decode(str);
			return User.fromJson(jsonData);
	}

	/// Method used to write a json by using a list of exercises
  ///
  /// @param : List<User>
  /// @return : String of a json file
	///
	String userToJson(User data) {
			final dyn = data.toJson();
			return json.encode(dyn);
	}
}
