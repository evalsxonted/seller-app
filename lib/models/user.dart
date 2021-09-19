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
}

class UserHandler {
  User fromMap(Map userInfo) {
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

  User fromJson(String userJson) {
    return fromMap(jsonDecode(userJson));
  }

  Map mapFromUser(User user) {
    return {
      "device": user.device,
      "name": user.name,
      "password": user.password,
      "phone": user.phone,
      "enabled": user.enabled,
      "language": user.language,
      "location": user.location,
      "province": user.province,
    };
  }

  String jsonFromUser(User user) {
    return jsonEncode(mapFromUser(user));
  }

  static String sqliteUserTable =
      'CREATE TABLE users(phone INTEGER PRIMARY KEY, name TEXT, password TEXT, province TEXT, location TEXT, language TEXT, enabled BOOLEAN)';
}
