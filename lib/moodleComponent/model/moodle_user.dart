// Supporting class for the preferences list
import 'package:flutter/cupertino.dart';

class Preference {
  final String name;
  final String? value; // Value can sometimes be a number in string form or a complex JSON string

  Preference({
    required this.name,
    this.value,
  });

  factory Preference.fromJson(Map<String, dynamic> json) {
    return Preference(
      name: json['name'] as String,
      // Value can be String, int, or null, so we convert it to String?
      value: json['value']?.toString(),
    );
  }
}

// Class representing the Moodle User
class MoodleUser {
  final int id;
  final String username;
  final String fullname;
  final String email;
  final String department;
  final String idnumber;
  final String auth;
  final bool suspended;
  final bool confirmed;
  final String lang;
  final String theme;
  final String timezone;
  final int mailformat;
  final int trackforums;
  final String description;
  final int descriptionformat;
  final String profileimageurlsmall;
  final String profileimageurl;
  final List<Preference> preferences;

  MoodleUser({
    required this.id,
    required this.username,
    required this.fullname,
    required this.email,
    required this.department,
    required this.idnumber,
    required this.auth,
    required this.suspended,
    required this.confirmed,
    required this.lang,
    required this.theme,
    required this.timezone,
    required this.mailformat,
    required this.trackforums,
    required this.description,
    required this.descriptionformat,
    required this.profileimageurlsmall,
    required this.profileimageurl,
    required this.preferences,
  });

  // Factory constructor to create a MoodleUser instance from a JSON map
  factory MoodleUser.fromJson(Map<String, dynamic> data) {
    debugPrint("Parsing MoodleUser from JSON: $data");
    var json = (data.entries.last.value as List<dynamic>).first;
    // Cast the preferences list of maps into a list of Preference objects
    final List<dynamic> preferencesJson = json['preferences'] as List<dynamic>;
    final List<Preference> preferences = preferencesJson
        .map((p) => Preference.fromJson(p as Map<String, dynamic>))
        .toList();

    return MoodleUser(
      id: json['id'] as int,
      username: json['username'] as String,
      fullname: json['fullname'] as String,
      email: json['email'] as String,
      department: json['department'] as String,
      idnumber: json['idnumber'] as String,
      auth: json['auth'] as String,
      suspended: json['suspended'] as bool,
      confirmed: json['confirmed'] as bool,
      lang: json['lang'] as String,
      theme: json['theme'] as String,
      timezone: json['timezone'] as String,
      mailformat: json['mailformat'] as int,
      trackforums: json['trackforums'] as int,
      description: json['description'] as String,
      descriptionformat: json['descriptionformat'] as int,
      profileimageurlsmall: json['profileimageurlsmall'] as String,
      profileimageurl: json['profileimageurl'] as String,
      preferences: preferences,
    );
  }

  //toString method for easier debugging
  @override
  String toString() {
    //with all fields
    return 'MoodleUser{id: $id, username: $username, fullname: $fullname, email: $email, department: $department, idnumber: $idnumber, auth: $auth, suspended: $suspended, confirmed: $confirmed, lang: $lang, theme: $theme, timezone: $timezone, mailformat: $mailformat, trackforums: $trackforums, description: $description, descriptionformat: $descriptionformat, profileimageurlsmall: $profileimageurlsmall, profileimageurl: $profileimageurl, preferences: $preferences}';
  }
}

// Class representing the root of the JSON array structure
// Note: The provided JSON is a list containing a single map (the response).
class MoodleUserResponse {
  final bool error;
  final List<MoodleUser> data;

  MoodleUserResponse({
    required this.error,
    required this.data,
  });

  factory MoodleUserResponse.fromJson(Map<String, dynamic> json) {
    // Cast the data list of maps into a list of MoodleUser objects
    final List<dynamic> dataJson = json['data'] as List<dynamic>;
    final List<MoodleUser> data = dataJson
        .map((u) => MoodleUser.fromJson(u as Map<String, dynamic>))
        .toList();

    return MoodleUserResponse(
      error: json['error'] as bool,
      data: data,
    );
  }
}
