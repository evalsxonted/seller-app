// import 'package:flutter/material.dart';
// import 'package:iraqmall/repo.dart';
//
// class CustomInput extends StatelessWidget {
//   final Widget inputIcon;
//   final String hintText;
//   final TextEditingController editingController;
//   final bool enabled;
//
//   const CustomInput({
//     this.inputIcon = const Icon(
//       Icons.text_fields,
//       color: Theme.of(context).hintColor,
//     ),
//     this.hintText,
//     required this.editingController,
//     this.enabled,
//   }) : super();
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 70,
//       decoration: BoxDecoration(
//         color: Theme.of(context).canvasColor,
//         borderRadius: BorderRadius.all(Radius.circular(smallPadding)),
//       ),
//       child: Center(
//         child: TextField(
//           style: Theme.of(context).textTheme.headline4,
//           controller: editingController,
//           enabled: enabled ?? true,
//           decoration: InputDecoration(
//               hintText: hintText,
//               icon: Padding(
//                   padding: EdgeInsetsDirectional.only(start: largePadding),
//                   child: inputIcon ??
//                       ),
//               border: InputBorder.none,
//               hintStyle: Theme.of(context)
//                   .textTheme
//                   .caption
//                   .copyWith(color: Theme.of(context).hintColor)),
//         ),
//       ),
//     );
//   }
// }
