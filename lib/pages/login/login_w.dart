import 'package:flutter/material.dart';
import 'package:seller/pages/login/login_c.dart';
import 'package:seller/pages/start/material_app_props_controller.dart';
import 'package:seller/utilities/ui_helper.dart';
import 'package:seller/widgets/overlay_c.dart';
import 'package:seller/widgets/overlay_w.dart';

class LoginInherit extends InheritedWidget {
  final LoginController loginController;
  final MyOverlayController overlayController;
  final Widget child;

  LoginInherit(
      {Key? key,
      required this.loginController,
      required this.overlayController,
      required this.child})
      : super(key: key, child: child);

  static LoginInherit? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<LoginInherit>();

  @override
  bool updateShouldNotify(covariant LoginInherit oldWidget) {
    return false;
  }
}

class Login extends StatelessWidget {
  final HelperUI _helperUI = HelperUI(PropsHandler.getContext);

  @override
  Widget build(BuildContext context) {
    return LoginInherit(
        loginController: LoginController(),
        overlayController: MyOverlayController(),
        child: Builder(
          builder: (context) =>
             Scaffold(
              backgroundColor: _helperUI.bgColor,
              appBar: null,
              body: MyOverlay(
                overlayChild: ValueListenableBuilder(
                  valueListenable: LoginInherit.of(context)!.loginController.fragmentNotifier,
                  builder: (_, Widget fragment, __) {
                    return fragment;
                  },
                ),
                overlayController: LoginInherit.of(context)!.overlayController,
              ),
            ),
        ));
  }
}
