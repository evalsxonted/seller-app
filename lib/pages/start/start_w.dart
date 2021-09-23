import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seller/pages/home/home.dart';
import 'package:seller/pages/login/login_w.dart';
import 'package:seller/pages/start/material_app_props_controller.dart';
import 'package:seller/pages/welcome/welcome_w.dart';
import 'package:seller/utilities/hive_prefs.dart';
import 'package:seller/utilities/theme_provider.dart';
import 'package:seller/widgets/waiting_page.dart';

class Start extends StatelessWidget {
  final PropsHandler _propsHandler = PropsHandler.singleton;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _propsHandler.notifier,
      builder: (_, __, ___) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'A Store App',
          theme: ThemeProvider.lightTheme,
          darkTheme: ThemeProvider.darkTheme,
          themeMode: _propsHandler.getThemeMode,
          locale: _propsHandler.getLocale,
          navigatorKey: PropsHandler.navigatorKey,
          initialRoute: _checkLogged ? '/home' : '/welcome',
          routes: {
            '/welcome': (context) => Welcome(),
            '/login': (context) => Login(),
            '/home': (context) => Home(),
          },
        );
      },
    );
  }

  bool get _checkLogged => HivePrefs.singleton?.getLogged ?? false;
}
