import 'package:flutter/material.dart';
import 'package:seller/utilities/ui_helper.dart';

import 'home_wrapper.dart';

enum ButtonType {
  primary,
  accent,
}

class MainButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback buttonFunction;
  final ButtonType buttonType;
  late final HelperUI _ui;

  MainButton({
    required this.buttonText,
    required this.buttonFunction,
    this.buttonType = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    _ui = HomeInherited.of(context)!.ui;
    return InkWell(
      onTap: buttonFunction,
      child: Container(
        alignment: Alignment.center,
        height: 70,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: getButtonColor,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Text(buttonText, style: getButtonTextColor),
      ),
    );
  }

  Color get getButtonColor {
    switch (buttonType) {
      case ButtonType.primary:
        return _ui.primaryButtonColor;
      case ButtonType.accent:
        return _ui.accentButtonColor;
    }
  }

  TextStyle? get getButtonTextColor {
    switch (buttonType) {
      case ButtonType.primary:
        return _ui.primaryButtonTextStyle;
      case ButtonType.accent:
        return _ui.accentButtonTextStyle;
    }
  }
}
