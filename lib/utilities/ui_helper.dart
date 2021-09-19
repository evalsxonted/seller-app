import 'package:flutter/material.dart';


class HelperUI{
final BuildContext context;
late ThemeData _currentTheme;

HelperUI(this.context){
  _currentTheme = _getTheme;
}

ThemeData get _getTheme => Theme.of(context);
Color get bgColor => _currentTheme.backgroundColor;
Color get hintColor => _currentTheme.hintColor;
Color get langButtonColor => _currentTheme.hintColor;


}