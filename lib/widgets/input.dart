import 'package:flutter/material.dart';
import 'package:seller/pages/start/material_app_props_controller.dart';
import 'package:seller/utilities/ui_helper.dart';

class CustomInput extends StatelessWidget {
  final Widget? inputIcon;
  final String? hintText;
  final TextEditingController editingController;
  final bool? enabled;
  final HelperUI _ui = HelperUI(PropsHandler.getContext);

  CustomInput(
      {Key? key,
      this.inputIcon,
      this.hintText,
      required this.editingController,
      this.enabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: _ui.textFieldBgColor,
        borderRadius: BorderRadius.all(Radius.circular(HelperUI.smallPadding)),
      ),
      child: Center(
        child: TextField(
          style: _ui.textFieldTextStyle,
          controller: editingController,
          enabled: enabled ?? true,
          decoration: InputDecoration(
              hintText: hintText ?? ".....",
              icon: Padding(
                  padding: EdgeInsetsDirectional.only(start: HelperUI.largePadding),
                  child: inputIcon ??
                      Icon(Icons.text_fields, color: _ui.iconColor)),
              border: InputBorder.none,
              hintStyle: _ui.hintStyle),
        ),
      ),
    );
  }
}
