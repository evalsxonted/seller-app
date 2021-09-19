

import 'package:flutter/material.dart';
import 'package:seller/utilities/locale_provider.dart';
import 'package:seller/utilities/theme_provider.dart';


class PropsHandler{

  late ValueNotifier<int> _valueNotifier;
  ThemeProvider _themeProvider = ThemeProvider();
  LocaleProvider _localeProvider = LocaleProvider();
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  late ThemeMode _themeMode ;
  late Locale _locale;

  PropsHandler._(){
    _themeMode = _themeProvider.getThemeMode;
    _locale = _localeProvider.getLocale;
    _valueNotifier = ValueNotifier(0);
  }

  static PropsHandler? _singleton;

  static PropsHandler get singleton {
    return _singleton ??= PropsHandler._();
  }

  ValueNotifier get notifier => _valueNotifier;

  void setThemeMode(ThemeMode newThemeMode){
    if(_themeMode == newThemeMode){
      return;
    }else{
      _themeMode = newThemeMode;
      _valueNotifier.value++;
      _themeProvider.saveThemeMode(newThemeMode);
    }
  }

  void setLocale(Locale newLocale){
    if(_locale == newLocale){
      return;
    }else{
      _locale = newLocale;
      _valueNotifier.value++;
      _localeProvider.saveLocale(newLocale);
    }
  }

  TextDirection  _currentDirectionality(Locale currentLocale) {
    if(currentLocale == LocaleProvider.englishLocale){
      return TextDirection.ltr;
    }else{
      return TextDirection.rtl;
    }
  }

  ThemeMode get getThemeMode => _themeMode;
  Locale get getLocale => _locale;
  TextDirection get getTextDirection => _currentDirectionality(_locale);
  static BuildContext get getContext => navigatorKey.currentContext!;

}