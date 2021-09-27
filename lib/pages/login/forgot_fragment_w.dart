import 'package:flutter/material.dart';
import 'package:seller/pages/login/forgot_fragment_c.dart';
import 'package:seller/pages/login/login_fragment.dart';
import 'package:seller/pages/login/login_w.dart';
import 'package:seller/pages/login/logo_bar.dart';
import 'package:seller/widgets/button_main.dart';
import 'package:seller/widgets/clickable_text.dart';
import 'package:seller/widgets/home_wrapper.dart';
import 'package:seller/widgets/input.dart';

import 'login_input.dart';

class ForgotFragment extends StatefulWidget {
  final int forgotInitialPage;

  const ForgotFragment({Key? key, required this.forgotInitialPage})
      : super(key: key);

  @override
  _ForgotFragmentState createState() => _ForgotFragmentState();
}

class _ForgotFragmentState extends State<ForgotFragment> {
  late final TextEditingController phoneController;
  late final TextEditingController codeController;
  late final TextEditingController newPassController;
  late final ForgotController forgotController;

  @override
  void initState() {
    forgotController = ForgotController(widget.forgotInitialPage);
    phoneController = TextEditingController();
    codeController = TextEditingController();
    newPassController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    codeController.dispose();
    newPassController.dispose();
    forgotController.forgotPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    HomeInherited homeInherited = HomeInherited.of(context)!;
    return SafeArea(
      child: Container(
        height: homeInherited.ui.maxHeight,
        child: PageView(
          controller: forgotController.forgotPageController,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: [
            Column(
              children: [
                LogoBar(),
                Padding(
                  padding: EdgeInsets.all(homeInherited.ui.largePadding),
                  child: Text(
                    homeInherited.languages.getText("forgotEnterPhoneMessage"),
                    style: homeInherited.ui.normalTextStyle,
                  ),
                ),
                LoginInput(
                  inputController: phoneController,
                  hintText: homeInherited.languages.getText("enterPhone"),
                  imageSrc: "assets/phone.png",
                ),
                Padding(
                    padding: EdgeInsets.all(homeInherited.ui.largePadding),
                    child: MainButton(
                        buttonText: homeInherited.languages.getText("next"),
                        buttonFunction: sendVerificationAction)),
                ClickableText(
                  text: homeInherited.languages.getText("cancel"),
                  textAction: cancelAction,
                ),
              ],
            ),
            Column(
              children: [
                LogoBar(),
                Padding(
                  padding: EdgeInsets.all(homeInherited.ui.largePadding),
                  child: Text(
                    homeInherited.languages.getText("enterResetCodeMessage"),
                    style: homeInherited.ui.normalTextStyle,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    right: homeInherited.ui.largePadding,
                    left: homeInherited.ui.largePadding,
                    top: homeInherited.ui.largePadding,
                  ),
                  child: CustomInput(
                    editingController: codeController,
                    hintText: homeInherited.languages.getText("resetCodeHint"),
                    inputIcon: Icon(
                      Icons.verified,
                      color: homeInherited.ui.iconColor,
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(homeInherited.ui.largePadding),
                    child: MainButton(
                        buttonText: homeInherited.languages.getText("next"),
                        buttonFunction: verifyResetCode)),
                ClickableText(
                  text: homeInherited.languages.getText("cancel"),
                  textAction: cancelAction,
                ),
              ],
            ),
            Column(
              children: [
                LogoBar(),
                Padding(
                  padding: EdgeInsets.all(homeInherited.ui.largePadding),
                  child: Text(
                    homeInherited.languages
                        .getText("forgotEnterPasswordMessage"),
                    style: homeInherited.ui.normalTextStyle,
                  ),
                ),
                LoginInput(
                  inputController: phoneController,
                  hintText: homeInherited.languages.getText("enterPassword"),
                  imageSrc: "assets/password.png",
                ),
                Padding(
                    padding: EdgeInsets.all(homeInherited.ui.largePadding),
                    child: MainButton(
                        buttonText: homeInherited.languages.getText("next"),
                        buttonFunction: newPasswordAction)),
                ClickableText(
                  text: homeInherited.languages.getText("cancel"),
                  textAction: cancelAction,
                ),
              ],
            ),
            Column(
              children: [
                LogoBar(),
                Padding(
                  padding: EdgeInsets.all(homeInherited.ui.largePadding),
                  child: Text(
                    homeInherited.languages
                        .getText("passwordAlreadyResetMessage"),
                    style: homeInherited.ui.normalTextStyle,
                  ),
                ),
                ClickableText(
                  text: homeInherited.languages.getText("back"),
                  textAction: cancelAction,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  sendVerificationAction() {
    LoginInherit.of(context)!.overlayController.setActive = true;
    forgotController.sendVerification().then((bool result) {
      if(result){
        LoginInherit.of(context)!.overlayController.setActive = false;
        LoginInherit.of(context)!.loginController.forgotInitialPage = 1;
        forgotController.setForgotPage = 1;
      }else{
        LoginInherit.of(context)!.overlayController.setActive = false;

      }
    });

  }

  verifyResetCode() {
    LoginInherit.of(context)!.loginController.forgotInitialPage = 2;
    forgotController.setForgotPage = 2;
  }

  newPasswordAction() {
    LoginInherit.of(context)!.loginController.forgotInitialPage = 3;
    forgotController.setForgotPage = 3;
  }

  cancelAction() {
    LoginInherit.of(context)!.loginController.setFragment = LoginFragment();
  }
}
