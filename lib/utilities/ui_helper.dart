import 'package:flutter/material.dart';

class HelperUI {
  final BuildContext context;
  late ThemeData _currentTheme;
  late MediaQueryData _mediaQuery;

  final double smallPadding = 5;
  final double normalPadding = 10;
  final double largePadding = 15;
  final double extraLargePadding = 40;

  HelperUI(this.context) {
    _currentTheme = _getTheme;
    _mediaQuery = _getMediaQuery;
  }

  TextDirection get currentDirection => Directionality.of(context);

  ThemeData get _getTheme => Theme.of(context);

  MediaQueryData get _getMediaQuery => MediaQuery.of(context);

  Color get bgColor => _currentTheme.backgroundColor;

  Color get hintColor => _currentTheme.hintColor;

  Color get langButtonColor => _currentTheme.hintColor;

  Color get iconColor => _currentTheme.hintColor;

  Color get highlightColor => _currentTheme.highlightColor;

  Color get cardColor => _currentTheme.cardColor;

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

  TextStyle? get discountedTextStyle => TextStyle(
      height: 1.2,
      fontSize: 15,
      color: _currentTheme.primaryColor,
      fontWeight: FontWeight.w700,
      decoration: TextDecoration.lineThrough);
  double get maxWidth => _mediaQuery.size.width;

  double get maxHeight => _mediaQuery.size.height;

  Color get primaryButtonColor => _currentTheme.primaryColor;

  Color get accentButtonColor => _currentTheme.accentColor;

  Color get dropDownColor => _currentTheme.canvasColor;

  Color get dialogButtonColor => _currentTheme.canvasColor;


}
