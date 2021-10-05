import 'package:flutter/material.dart';
import 'package:seller/pages/login/forgot_fragment_c.dart';
import '../../widgets/logo_bar.dart';
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
  late final ForgotController forgotController;

  @override
  void initState() {
    forgotController = ForgotController(context , widget.forgotInitialPage);
    super.initState();
  }

  @override
  void dispose() {
    forgotController.phoneController.dispose();
    forgotController.codeController.dispose();
    forgotController.newPassController.dispose();
    forgotController.forgotPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    HomeInherited homeInherited = HomeInherited.of(context)!;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            LogoBar(),
            Container(
              height: homeInherited.ui.maxHeight,
              child: PageView(
                controller: forgotController.forgotPageController,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(homeInherited.ui.largePadding),
                        child: Text(
                          homeInherited.languages
                              .getText("forgotEnterPhoneMessage"),
                          style: homeInherited.ui.normalTextStyle,
                        ),
                      ),
                      LoginInput(
                        inputController: forgotController.phoneController,
                        hintText: homeInherited.languages.getText("enterPhone"),
                        imageSrc: "assets/phone.png",
                      ),
                      Padding(
                          padding:
                              EdgeInsets.all(homeInherited.ui.largePadding),
                          child: MainButton(
                              buttonText:
                                  homeInherited.languages.getText("next"),
                              buttonFunction: forgotController.sendVerificationAction)),
                      ClickableText(
                        text: homeInherited.languages.getText("cancel"),
                        textAction: forgotController.cancelAction,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      // LogoBar(),
                      Padding(
                        padding: EdgeInsets.all(homeInherited.ui.largePadding),
                        child: Text(
                          homeInherited.languages
                              .getText("enterResetCodeMessage"),
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
                          editingController: forgotController.codeController,
                          hintText:
                              homeInherited.languages.getText("resetCodeHint"),
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
                          buttonFunction: forgotController.verifyResetCode,
                        ),
                      ),
                      ClickableText(
                        text: homeInherited.languages.getText("cancel"),
                        textAction: forgotController.cancelAction,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      // LogoBar(),
                      Padding(
                        padding: EdgeInsets.all(homeInherited.ui.largePadding),
                        child: Text(
                          homeInherited.languages
                              .getText("forgotEnterPasswordMessage"),
                          style: homeInherited.ui.normalTextStyle,
                        ),
                      ),
                      LoginInput(
                        inputController: forgotController.phoneController,
                        hintText:
                            homeInherited.languages.getText("enterPassword"),
                        imageSrc: "assets/password.png",
                      ),
                      Padding(
                          padding:
                              EdgeInsets.all(homeInherited.ui.largePadding),
                          child: MainButton(
                              buttonText:
                                  homeInherited.languages.getText("next"),
                              buttonFunction: forgotController.newPasswordAction)),
                      ClickableText(
                        text: homeInherited.languages.getText("cancel"),
                        textAction: forgotController.cancelAction,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      // LogoBar(),
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
                        textAction: forgotController.cancelAction,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
