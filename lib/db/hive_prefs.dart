import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class HivePrefs {
  static Box? _prefsBox;
  static HivePrefs? singleton;

  HivePrefs._();

  static open() async {
    HivePrefs hivePrefs = HivePrefs._();
    _prefsBox = await Hive.openBox("prefs");
    singleton = hivePrefs;
  }

  clearBox() async {
    _prefsBox?.clear();
  }

  String get getTheme => _prefsBox?.get('theme') ?? "dark";

  setTheme(String newTheme) async {
    _prefsBox?.put("theme", newTheme);
  }

  bool get getLogged => _prefsBox?.get('logged') ?? false;

  setLogged(bool logged) {
    _prefsBox?.put("logged", logged);
  }

  String get getLocale => _prefsBox?.get('locale') ?? "en-US";

  setLocale(Locale locale) {
    _prefsBox?.put("locale", locale.languageCode+ "-"+ locale.countryCode.toString());
  }
  int get getUserPhone => _prefsBox?.get('user') ?? -1;
  setUserPhone(int phone) {
    _prefsBox?.put("user", phone);
  }
}
