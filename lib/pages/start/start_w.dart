
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seller/pages/home/home.dart';
import 'package:seller/pages/start/material_app_props_controller.dart';
import 'package:seller/pages/start/start_c.dart';
import 'package:seller/pages/welcome/welcome_w.dart';
import 'package:seller/utilities/theme_provider.dart';
import 'package:seller/widgets/waiting_page.dart';

class Start extends StatelessWidget {
  final ThemeProvider _themeProvider = ThemeProvider();
  final StartPageController _startController = StartPageController.singleton;
  final PropsHandler _propsHandler = PropsHandler.singleton;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _propsHandler.notifier,
      builder: (_, __, ___) {
        return MaterialApp(
          title: 'IraqMall',
          theme: _themeProvider.lightTheme,
          darkTheme: _themeProvider.darkTheme,
          themeMode: _propsHandler.getThemeMode,
          locale: _propsHandler.getLocale,
          navigatorKey: PropsHandler.navigatorKey,
          home: Directionality(
            textDirection: _propsHandler.getTextDirection,
            child: ValueListenableBuilder(
              valueListenable: _startController.startPageNotifier,
              builder: (context, value, child) {
                switch(value){
                  case StartPage.wait: return WaitingPage();
                  case StartPage.home : return Home();
                  case StartPage.welcome : return Welcome();
                  default: return WaitingPage();
                }
              },
            ),
          ),
        );
      },
    );
  }

}
