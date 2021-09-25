import 'package:flutter/material.dart';
import 'package:seller/pages/login/login_w.dart';
import 'package:seller/pages/login/signup_fragment.dart';
import 'package:seller/utilities/ui_helper.dart';
import 'package:seller/widgets/button_main.dart';
import 'package:seller/widgets/home_wrapper.dart';
import 'package:seller/widgets/input.dart';

import 'logo_bar.dart';

class LoginFragment extends StatelessWidget {
  static TextEditingController _phoneController = TextEditingController();
  static TextEditingController _passwordController = TextEditingController();
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
          Container(
            margin: EdgeInsets.only(
              right: HelperUI.largePadding,
              left: HelperUI.largePadding,
              top: HelperUI.largePadding,
            ),
            child: CustomInput(
              key: Key("phone"),
              editingController: _phoneController,
              hintText: homeInherited.languages.getText("enterPhone"),
              inputIcon: Image.asset(
                "assets/phone.png",
                width: 20,
                height: 20,
              ),
            ),
          ),
          //password input
          Container(
            margin: EdgeInsets.only(
                right: HelperUI.largePadding,
                left: HelperUI.largePadding,
                top: HelperUI.largePadding,
                bottom: HelperUI.extraLargePadding),
            child: CustomInput(
              key: Key("password"),
              editingController: _passwordController,
              hintText: homeInherited.languages.getText("enterPassword"),
              inputIcon: Image.asset(
                "assets/password.png",
                width: 20,
                height: 20,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Text(
              homeInherited.languages.getText("forgotPassword"),
              style: homeInherited.ui.normalTextStyle
                  ?.copyWith(color: homeInherited.ui.hintColor),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                right: HelperUI.largePadding,
                left: HelperUI.largePadding,
                top: HelperUI.largePadding,
                bottom: HelperUI.largePadding),
            child: MainButton(
              buttonText: homeInherited.languages.getText("login"),
              buttonType: ButtonType.primary,
              buttonFunction: () {},
            ),
          ),
          InkWell(
            onTap: () => goToSignUpFragment(context),
            child: Text(
              homeInherited.languages.getText("newAccount"),
              style: homeInherited.ui.normalTextStyle
                  ?.copyWith(color: homeInherited.ui.hintColor),
            ),
          ),
        ],
      ),
    );
  }
  goToSignUpFragment(BuildContext context) => LoginInherit.of(context)!.loginController.changePage = SignUpFragment();
}
