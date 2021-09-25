import 'package:flutter/material.dart';

class HelperUI {
  final BuildContext context;
  late ThemeData _currentTheme;
  late MediaQueryData _mediaQuery;

  static const double smallPadding = 5;
  static const double normalPadding = 10;
  static const double largePadding = 15;
  static const double extraLargePadding = 40;

  HelperUI(this.context) {
    _currentTheme = _getTheme;
    _mediaQuery = _getMediaQuery;
  }

  ThemeData get _getTheme => Theme.of(context);

  MediaQueryData get _getMediaQuery => MediaQuery.of(context);

  Color get bgColor => _currentTheme.backgroundColor;

  Color get hintColor => _currentTheme.hintColor;

  Color get langButtonColor => _currentTheme.hintColor;

  Color get iconColor => _currentTheme.hintColor;

  Color get highlightColor => _currentTheme.highlightColor;

  Color get textFieldBgColor => _currentTheme.canvasColor;
  TextStyle? get textFieldHintStyle => _currentTheme.textTheme.caption
      ?.copyWith(color: hintColor);
  TextStyle? get textFieldTextStyle => _currentTheme.textTheme.headline4;

  TextStyle? get bigTitleTextStyle => _currentTheme.textTheme.headline1;

  TextStyle? get titleTextStyle => _currentTheme.textTheme.headline2;

  TextStyle? get bigTextStyle => _currentTheme.textTheme.headline3;

  TextStyle? get normalTextStyle => _currentTheme.textTheme.headline4;

  TextStyle? get smallTextStyle => _currentTheme.textTheme.headline5;

  TextStyle? get primaryButtonTextStyle => _currentTheme.textTheme.headline4;

  TextStyle? get accentButtonTextStyle => _currentTheme.textTheme.headline4?.copyWith(color: hintColor);

  TextStyle? get highlightTextStyle =>  normalTextStyle?.copyWith(
      decoration: TextDecoration.underline,
      color: _currentTheme.accentColor);

  double get maxWidth => _mediaQuery.size.width;

  double get maxHeight => _mediaQuery.size.height;

  Color get primaryButtonColor => _currentTheme.primaryColor;

  Color get accentButtonColor => _currentTheme.accentColor;


}
