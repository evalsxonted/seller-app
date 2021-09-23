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

  Color get textFieldBgColor => _currentTheme.canvasColor;
  TextStyle? get textFieldHintStyle => _currentTheme.textTheme.caption
      ?.copyWith(color: hintColor);
  TextStyle? get textFieldTextStyle => _currentTheme.textTheme.bodyText1;
  double get maxWidth => _mediaQuery.size.width;

  double get maxHeight => _mediaQuery.size.height;
}
