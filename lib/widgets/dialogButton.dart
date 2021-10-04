import 'package:flutter/material.dart';
import 'package:seller/utilities/ui_helper.dart';
import 'package:seller/widgets/home_wrapper.dart';

class DialogButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback buttonFunction;
  const DialogButton({Key? key, required this.buttonText,required this.buttonFunction}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HelperUI ui = HomeInherited.of(context)!.ui;
    return InkWell(
      onTap: buttonFunction,
      child: Container(
        alignment: Alignment.center,
        width: 90,
        height: 30,
        decoration: BoxDecoration(
          color: ui.dialogButtonColor,
          borderRadius: BorderRadius.all(Radius.circular(ui.largePadding)),
        ),
        child: Text(buttonText, style: ui.smallTextStyle),
      ),
    );
  }
}
