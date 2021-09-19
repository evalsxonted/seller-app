// import 'package:flutter/material.dart';
//
// class DialogButton extends StatelessWidget {
//   final String buttonText;
//   final Function buttonFunction;
//   final Color buttonColor;
//   const DialogButton({Key key, this.buttonText, this.buttonFunction, this.buttonColor}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: buttonFunction,
//       child: Container(
//         alignment: Alignment.center,
//         width: 90,
//         height: 30,
//         decoration: BoxDecoration(
//           color: buttonColor,
//           borderRadius: BorderRadius.all(Radius.circular(15)),
//         ),
//         child: Text(buttonText, style: Theme.of(context).textTheme.bodyText2.copyWith(
//           color:  buttonColor == Theme.of(context).accentColor? Theme.of(context).hintColor : Theme.of(context).textTheme.button.color,
//         ),),
//       ),
//     );
//   }
// }
