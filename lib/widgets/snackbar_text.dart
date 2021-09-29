

import 'package:flutter/material.dart';
import 'package:seller/widgets/home_wrapper.dart';

class MySnackBarContent extends StatelessWidget {
  final String snackText;
  const MySnackBarContent({Key? key,required this.snackText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeInherited homeInherited = HomeInherited.of(context)!;
    return Text(
      homeInherited.languages.getText(snackText),
      style: HomeInherited.of(context)!
          .ui
          .bigTextStyle
          ?.copyWith(color: homeInherited.ui.hintColor),
    );
  }
}
