import 'package:flutter/material.dart';
import 'package:seller/utilities/ui_helper.dart';
import 'package:seller/widgets/home_wrapper.dart';

class BuyingPrice extends StatelessWidget {
  final String priceText;
  final String pricePrice;
  const BuyingPrice({Key? key,required this.priceText,required this.pricePrice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HelperUI ui = HomeInherited.of(context)!.ui;
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(
          right: ui.largePadding,
          left: ui.largePadding,
          top: ui.largePadding,
        ),
        height: 70,
        decoration: BoxDecoration(
          color: ui.textFieldBgColor,
          borderRadius:
          BorderRadius.all(Radius.circular(ui.smallPadding)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              priceText,
              style: ui.normalTextStyle,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              pricePrice,
              style: ui.normalTextStyle,
            ),
          ],
        ));
  }
}
