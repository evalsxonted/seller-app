import 'package:flutter/material.dart';
import 'package:seller/utilities/ui_helper.dart';
import 'package:seller/widgets/home_wrapper.dart';

class CustomInput extends StatelessWidget {
  final Widget? inputIcon;
  final String? hintText;
  final TextEditingController editingController;
  final bool? enabled;

  CustomInput(
      {Key? key,
      this.inputIcon,
      this.hintText,
      required this.editingController,
      this.enabled})
      : super(key: key) ;


  @override
  Widget build(BuildContext context) {
    HelperUI _ui = HomeInherited.of(context)!.ui;
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: _ui.textFieldBgColor,
        borderRadius: BorderRadius.all(Radius.circular(_ui.smallPadding)),
      ),
      child: Center(
        child: TextField(
          style: _ui.textFieldTextStyle,
          controller: editingController,
          enabled: enabled ?? true,
          decoration: InputDecoration(
              hintText: hintText ?? ".....",
              icon: Padding(
                  padding: EdgeInsetsDirectional.only(start: _ui.largePadding),
                  child: inputIcon ??
                      Icon(Icons.text_fields, color: _ui.iconColor)),
              border: InputBorder.none,
              hintStyle: _ui.textFieldHintStyle),
        ),
      ),
    );
  }
}
