import 'package:flutter/material.dart';
import 'package:seller/utilities/ui_helper.dart';
import 'package:seller/widgets/home_wrapper.dart';

class CartDetailsInput extends StatelessWidget {
  final String hintText;
  final VoidCallback onClickAction;

  const CartDetailsInput({Key? key,required this.hintText,required this.onClickAction}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HelperUI ui = HomeInherited.of(context)!.ui;
    return InkWell(
      onTap: onClickAction,
      child: Container(
          margin: EdgeInsets.only(left: ui.normalPadding, right: ui.normalPadding, bottom: ui.normalPadding),
          height: 40,
          width: ui.maxWidth,
          decoration: BoxDecoration(
            color: ui.textFieldBgColor,
            borderRadius:
            BorderRadius.all(Radius.circular(ui.smallPadding)),
          ),
          child: Center(
            child: Text(
              hintText,
              style: ui.smallTextStyle?.copyWith(color: ui.hintColor),
            ),
          )
      ),
    );
  }
}
