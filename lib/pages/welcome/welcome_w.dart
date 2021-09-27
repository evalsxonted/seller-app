import 'package:flutter/material.dart';
import 'package:seller/pages/welcome/carousel.dart';
import 'package:seller/widgets/home_wrapper.dart';
import 'language_buttons_w.dart';
import 'welcome_c.dart';

class WelcomeInherit extends InheritedWidget {
  final CarouselPageController carouselController;
  final Widget child;
  WelcomeInherit(
      {Key? key, required this.carouselController, required this.child })
      : super(key: key, child: child);

  static WelcomeInherit? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<WelcomeInherit>();

  @override
  bool updateShouldNotify(covariant WelcomeInherit oldWidget) {
    return !identical(carouselController, oldWidget.carouselController);
  }
}

class Welcome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return WelcomeInherit(
      carouselController: CarouselPageController(),
      child: Builder(builder: (context){
        HomeInherited homeInherited = HomeInherited.of(context)!;
        return Scaffold(
          backgroundColor: homeInherited.ui.bgColor,
          appBar: AppBar(
            backgroundColor: homeInherited.ui.bgColor,
            elevation: 0,
            leadingWidth: 200,
            leading: LanguageButtons(),
            actions: [
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: InkWell(
                  onTap: () => skipAction(context),
                  child: Text(
                    homeInherited.languages.getText("skip"),
                    style: homeInherited.ui.bigTextStyle,
                  ),
                ),
              )
            ],
          ),
          body: Padding(
            padding: EdgeInsets.only(left: homeInherited.ui.largePadding, right: homeInherited.ui.largePadding, top: homeInherited.ui.largePadding),
            child: CarouselWrapper(),
          ),
        );
      }),
    );
  }
  skipAction(BuildContext context) =>   Navigator.pushReplacementNamed(context, '/login');
}
