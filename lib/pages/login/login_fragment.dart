import 'package:flutter/material.dart';
import 'package:seller/pages/login/login_w.dart';
import 'package:seller/pages/login/signup_fragment.dart';
import 'package:seller/widgets/button_main.dart';
import 'package:seller/widgets/clickable_text.dart';
import 'package:seller/widgets/home_wrapper.dart';
import 'forgot_fragment_w.dart';
import 'login_input.dart';
import 'logo_bar.dart';

class LoginFragment extends StatefulWidget {
  @override
  _LoginFragmentState createState() => _LoginFragmentState();
}

class _LoginFragmentState extends State<LoginFragment> {
  late final TextEditingController _phoneController;

  late final TextEditingController _passwordController;

  @override
  void initState() {
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
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
            inputController: _phoneController,
            hintText: homeInherited.languages.getText("enterPhone"),
            imageSrc: "assets/phone.png",
          ),
          //password input
          LoginInput(
            inputController: _passwordController,
            hintText: homeInherited.languages.getText("enterPassword"),
            imageSrc: "assets/password.png",
          ),
          SizedBox(
            height: homeInherited.ui.largePadding,
          ),
          ClickableText(
            text: homeInherited.languages.getText("forgotPassword"),
            textAction: goToForgotFragment,
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
              buttonFunction: () {},
            ),
          ),
          ClickableText(
            text: homeInherited.languages.getText("newAccount"),
            textAction: goToSignUpFragment,
          ),
        ],
      ),
    );
  }

  goToSignUpFragment() =>
      LoginInherit.of(context)!.loginController.setFragment = SignUpFragment();

  goToForgotFragment() =>
      LoginInherit.of(context)!.loginController.setFragment = ForgotFragment(
          forgotInitialPage:
          LoginInherit.of(context)!.loginController.forgotInitialPage);
}
