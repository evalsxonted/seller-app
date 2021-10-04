import 'package:flutter/material.dart';
import 'package:seller/pages/cart/cart_w.dart';
import 'package:seller/pages/central/central_w.dart';
import 'package:seller/pages/customer_service/customer_service_w.dart';
import 'package:seller/pages/login/login_w.dart';
import 'package:seller/pages/start/material_app_props_controller.dart';
import 'package:seller/pages/welcome/welcome_w.dart';
import '../../db/hive_prefs.dart';
import 'package:seller/utilities/theme_provider.dart';
import 'package:seller/widgets/home_wrapper.dart';

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
          navigatorKey: _propsHandler.navigatorKey,
          initialRoute: _checkLogged ? '/central' : '/welcome',
          routes: {
            '/welcome': (context) => HomeWrapper(
              child: Welcome(),
            ),
            '/login': (context) => HomeWrapper(
              child: Login(),
            ),
            '/central': (context) => HomeWrapper(
              child: Central(),
            ),
            '/customerServices': (context) => HomeWrapper(
              child: CustomerService(),
            ),
            '/cart': (context) => HomeWrapper(
              child: Cart(),
            ),

          },
        );
      },
    );
  }

  bool get _checkLogged => HivePrefs.singleton?.getLogged ?? false;
}
