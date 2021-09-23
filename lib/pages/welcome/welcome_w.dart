import 'package:flutter/material.dart';
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
      {Key? key, required this.carouselController, required this.child,})
      : super(key: key, child: child);

  static WelcomeInherit? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<WelcomeInherit>();

  @override
  bool updateShouldNotify(covariant WelcomeInherit oldWidget) {
    return false;
  }
}

class Welcome extends StatelessWidget{
  late final HelperUI ui;
  final Languages languages = Languages(PropsHandler.singleton.getLocale);

  @override
  Widget build(BuildContext context) {
    ui = HelperUI(PropsHandler.getContext);
    return WelcomeInherit(
      carouselController: CarouselPageController(),
      child: Builder(builder: (context){
        WelcomeInherit welcomeInherit = WelcomeInherit.of(context)!;
        return Scaffold(
          backgroundColor: ui.bgColor,
          appBar: AppBar(
            backgroundColor: ui.bgColor,
            elevation: 0,
            leadingWidth: 200,
            leading: LanguageButtons(),
            actions: [
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: InkWell(
                  onTap: () => skipAction(context),
                  child: Text(
                    languages.getText("skip"),
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
        );
      }),
    );
  }

  skipAction(BuildContext context) =>   Navigator.pushReplacementNamed(context, '/login');
}
