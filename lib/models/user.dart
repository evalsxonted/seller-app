import 'dart:convert';

class User {
  final String device;
  final String name;
  final String password;
  final String? province;
  final String? location;
  final String? language;
  final int phone;
  final bool enabled;

  User({
    required this.device,
    required this.name,
    required this.password,
    this.province,
    this.location,
    this.language,
    required this.phone,
    required this.enabled,
  });
  static User fromMap(Map userInfo) {
    return User(
      device: userInfo["device"],
      name: userInfo["name"],
      password: userInfo["password"],
      phone: userInfo["phone"],
      enabled: userInfo["enabled"],
      language: userInfo["language"],
      location: userInfo["location"],
      province: userInfo["province"],
    );
  }
  static User fromJson(String userJson) {
    return fromMap(jsonDecode(userJson));
  }
  Map<String, Object?> toMap() {
    return {
      "device": device,
      "name": name,
      "password": password,
      "phone": phone,
      "enabled": enabled,
      "language": language,
      "location": location,
      "province": province,
    };
  }
  Map<String, Object?> toSqlMap() {
    return {
      "device": device,
      "name": name,
      "password": password,
      "phone": phone,
      "enabled": enabled? 1 : 0,
      "language": language,
      "location": location,
      "province": province,
    };
  }
  String jsonFromUser() {
    return jsonEncode(toMap());
  }
  static String sqliteUserTable =
      'CREATE TABLE IF NOT EXISTS users(phone INTEGER PRIMARY KEY, name TEXT,'
      ' password TEXT, province TEXT, location TEXT, language TEXT, enabled INTEGER, device TEXT)';
}
