import 'package:flutter/material.dart';
import 'package:seller/widgets/appbar_global.dart';
import 'package:seller/widgets/home_wrapper.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    HomeInherited homeInherited = HomeInherited.of(context)!;
    return Scaffold(
      backgroundColor: homeInherited.ui.bgColor,
      appBar: AppBarGlobal(
        title: homeInherited.languages.getText("aboutUs"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(homeInherited.languages.getText("aboutMessage"),
                overflow: TextOverflow.ellipsis,
                maxLines: 20,
                textAlign: TextAlign.center,
                style: homeInherited.ui.bigTextStyle),
            SelectableText(homeInherited.languages.getText("email"),
                style: homeInherited.ui.titleTextStyle),
          ],
        ),
      ),
    );
  }
}
