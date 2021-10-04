import 'package:flutter/material.dart';
class InputMargin extends StatelessWidget {
  final Widget child;
  final double padding;

  const InputMargin({Key? key,required this.child, required this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(
        right: padding,
        left: padding,
        top: padding,
      ),
      child: child,
    );
  }
}
