import 'package:flutter/material.dart';
import 'package:seller/widgets/home_wrapper.dart';

class ClickableText extends StatelessWidget {
  final VoidCallback textAction;
  final String text;

  const ClickableText({Key? key,required this.textAction,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: textAction,
      child: Text(
        text,
        style: HomeInherited.of(context)!.ui.normalTextStyle
            ?.copyWith(color: HomeInherited.of(context)!.ui.hintColor),
      ),
    );
  }
}
