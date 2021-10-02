import 'package:flutter/material.dart';
import 'package:seller/utilities/ui_helper.dart';
import 'package:seller/widgets/home_wrapper.dart';

class DrawerItem extends StatelessWidget {
  final String itemText;
  final String itemIcon;
  final VoidCallback itemOnClick;
  const DrawerItem({Key? key,required this.itemText,required this.itemIcon,required this.itemOnClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HelperUI ui = HomeInherited.of(context)!.ui;
    return Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: ui.hintColor,
                    width: 0.5
                )
            )
        ),
        padding: EdgeInsets.all(15),
        child: InkWell(
          onTap: itemOnClick,
          child: Row(
            children: [
              Image.asset(itemIcon, width: 20, height: 20,),
              SizedBox(width: 15,),
              Text(itemText, style: ui.normalTextStyle?.copyWith(
                  color: ui.hintColor
              ),)
            ],
          ),
        )
    );
  }
}
