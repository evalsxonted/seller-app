import 'package:flutter/material.dart';
import 'package:seller/pages/login/login_fragment_c.dart';
import 'package:seller/widgets/button_main.dart';
import 'package:seller/widgets/clickable_text.dart';
import 'package:seller/widgets/home_wrapper.dart';
import 'login_input.dart';
import 'logo_bar.dart';

class LoginFragment extends StatefulWidget {
  @override
  _LoginFragmentState createState() => _LoginFragmentState();
}

class _LoginFragmentState extends State<LoginFragment> {
  late final LoginFragmentController loginFragmentController ;
  @override
  void initState() {
    loginFragmentController = LoginFragmentController(context);
    super.initState();
  }

  @override
  void dispose() {
    loginFragmentController.phoneController.dispose();
    loginFragmentController.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    HomeInherited homeInherited = HomeInherited.of(context)!;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //logo bar
          LogoBar(),
          //phone input
          LoginInput(
            inputController: loginFragmentController.phoneController,
            hintText: homeInherited.languages.getText("enterPhone"),
            imageSrc: "assets/phone.png",
          ),
          //password input
          LoginInput(
            inputController: loginFragmentController.passwordController,
            hintText: homeInherited.languages.getText("enterPassword"),
            imageSrc: "assets/password.png",
          ),
          SizedBox(
            height: homeInherited.ui.largePadding,
          ),
          ClickableText(
            text: homeInherited.languages.getText("forgotPassword"),
            textAction: loginFragmentController.goToForgotFragment,
          ),
          Container(
            margin: EdgeInsets.only(
                right: homeInherited.ui.largePadding,
                left: homeInherited.ui.largePadding,
                top: homeInherited.ui.largePadding,
                bottom: homeInherited.ui.largePadding),
            child: MainButton(
              buttonText: homeInherited.languages.getText("login"),
              buttonType: ButtonType.primary,
              buttonFunction: loginFragmentController.loginAction,
            ),
          ),
          ClickableText(
            text: homeInherited.languages.getText("newAccount"),
            textAction: loginFragmentController.goToSignUpFragment,
          ),
        ],
      ),
    );
  }


}
