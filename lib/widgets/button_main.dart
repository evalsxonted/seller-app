import 'package:flutter/material.dart';

enum ButtonType {
  primary,
  accent,
}

class MainButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback buttonFunction;
  final ButtonType buttonType;

  const MainButton(
      {required this.buttonText,
      required this.buttonFunction,
       this.buttonType = ButtonType.primary});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: buttonFunction,
      child: Container(
        alignment: Alignment.center,
        height: 70,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: getButtonColor(context),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Text(buttonText, style: getButtonTextColor(context)),
      ),
    );
  }
  Color getButtonColor(BuildContext context){
    switch(buttonType){
      case ButtonType.primary: return Theme.of(context).primaryColor;
      case ButtonType.accent: return Theme.of(context).accentColor;
      default : return Theme.of(context).primaryColor;
    }
  }
  TextStyle? getButtonTextColor(BuildContext context){
    switch(buttonType){
      case ButtonType.primary: return Theme.of(context).textTheme.button;
      case ButtonType.accent: return Theme.of(context).textTheme.button?.copyWith(color: Theme.of(context).hintColor);
      default : return Theme.of(context).textTheme.button;
    }
  }
}
