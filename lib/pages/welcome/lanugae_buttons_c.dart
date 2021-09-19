import 'package:flutter/material.dart';

class LangBtnController{

  final ValueNotifier<bool> _languageButton = ValueNotifier<bool>(false);
  ValueNotifier get langButtonNotifier => _languageButton;
  set setLangPressed(bool pressed) => { _languageButton.value = pressed };

}