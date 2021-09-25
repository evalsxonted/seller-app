import 'package:flutter/material.dart';
import 'package:seller/utilities/ui_helper.dart';
import 'package:seller/widgets/home_wrapper.dart';

class LogoBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeInherited homeInherited = HomeInherited.of(context)!;
    return Container(
      width: homeInherited.ui.maxWidth,
      margin: EdgeInsets.only(
          left: HelperUI.largePadding,
          top: HelperUI.extraLargePadding,
          right: HelperUI.largePadding,
          bottom: HelperUI.extraLargePadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/logo.png",
            width: 50,
            height: 50,
          ),
          Text(
            homeInherited.languages.getText("logo"),
            style: homeInherited.ui.bigTitleTextStyle
                ?.copyWith(color: homeInherited.ui.hintColor),
          ),
        ],
      ),
    );
  }
}
