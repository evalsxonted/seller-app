import 'package:flutter/material.dart';
import 'package:seller/utilities/ui_helper.dart';
import 'package:seller/widgets/home_wrapper.dart';

class CustomDropDown extends StatelessWidget {
  final List<String> items;
  final String selectedItem;
  final Function onChange;
  final String? hint;
  const CustomDropDown({Key? key,required this.items,
    required this.selectedItem, required this.onChange,
    this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HelperUI ui = HomeInherited.of(context)!.ui;
    return Container(
      padding: EdgeInsets.only(
          left: ui.largePadding, right: ui.largePadding),
      height: 70,
      decoration: BoxDecoration(
        color: ui.textFieldBgColor,
        borderRadius: BorderRadius.all(Radius.circular(ui.smallPadding)),
      ),
      child: Center(
        child: DropdownButton<String>(
          elevation: 10,
          style: ui.bigTextStyle,
          hint: Text(hint?? "", style: ui.normalTextStyle?.copyWith(
            color: ui.hintColor
          ),),
          dropdownColor: ui.cardColor,
          value: selectedItem,
          icon: Icon(Icons.keyboard_arrow_down),
          underline: Container(),
          isExpanded: true,
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: new Text(value),
            );
          }).toList(),
          onChanged: (value) {
            onChange(value);
          },
        ),
      ),
    );
  }
}
