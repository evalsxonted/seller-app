import 'package:flutter/material.dart';
import 'package:seller/pages/login/login_w.dart';
import 'package:seller/pages/start/material_app_props_controller.dart';
import 'package:seller/pages/welcome/carousel.dart';
import 'package:seller/utilities/langauges.dart';
import 'package:seller/utilities/ui_helper.dart';
import 'language_buttons_w.dart';
import 'welcome_c.dart';

class WelcomeInherit extends InheritedWidget {
  final CarouselPageController carouselController;
  final Widget child;

  WelcomeInherit(
      {Key? key, required this.carouselController, required this.child})
      : super(key: key, child: child);

  static WelcomeInherit? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<WelcomeInherit>();

  @override
  bool updateShouldNotify(covariant WelcomeInherit oldWidget) {
    return false;
  }
}

class Welcome extends StatelessWidget {
  final HelperUI _ui = HelperUI(PropsHandler.getContext);
  final Languages _languages = Languages(PropsHandler.singleton.getLocale);

  @override
  Widget build(BuildContext context) {
    return WelcomeInherit(
      carouselController: CarouselPageController(),
      child: Scaffold(
        backgroundColor: _ui.bgColor,
        appBar: AppBar(
          backgroundColor: _ui.bgColor,
          elevation: 0,
          leadingWidth: 200,
          leading: LanguageButtons(),
          actions: [
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: InkWell(
                onTap: () => skipAction(context),
                child: Text(
                  _languages.getText("skip"),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: CarouselWrapper(),
        ),
      ),
    );
  }

  skipAction(BuildContext context) => Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
}
