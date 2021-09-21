import 'package:flutter/material.dart';

class MyOverlayController{
  final ValueNotifier<bool> _overlayNotifier = ValueNotifier<bool>(false);
  ValueNotifier<bool> get overlayNotifier => _overlayNotifier;
  set setActive(bool isActive) => { _overlayNotifier.value = isActive };
  bool get isActive => _overlayNotifier.value;
}