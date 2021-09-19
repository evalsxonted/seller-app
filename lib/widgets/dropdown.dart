// import 'package:flutter/material.dart';
// import '../repo.dart';
//
// class CustomDropDown extends StatelessWidget {
//   final List<String> items;
//   final String selectedItem;
//   final Function onChange;
//   final String hint;
//   const CustomDropDown({Key key, this.items, this.selectedItem, this.onChange, this.hint}) : super(key: key);
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
//         child: DropdownButton<String>(
//           elevation: 10,
//           style: Theme.of(context).textTheme.headline4,
//           hint: Text(hint?? "", style: Theme.of(context).textTheme.bodyText1.copyWith(
//             color: Theme.of(context).hintColor
//           ),),
//
//           dropdownColor: Theme.of(context).cardColor,
//           value: selectedItem,
//           icon: Icon(Icons.keyboard_arrow_down),
//           underline: Container(),
//           isExpanded: true,
//           items: items.map((String value) {
//             return DropdownMenuItem<String>(
//               value: value,
//               child: new Text(value),
//             );
//           }).toList(),
//           onChanged: (value) {
//             onChange(value);
//           },
//         ),
//       ),
//     );
//   }
// }
