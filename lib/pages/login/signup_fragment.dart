
import 'package:flutter/material.dart';
import 'package:seller/utilities/ui_helper.dart';
import 'package:seller/widgets/button_main.dart';
import 'package:seller/widgets/home_wrapper.dart';
import 'package:seller/widgets/input.dart';

import 'login_fragment.dart';
import 'login_w.dart';
import 'logo_bar.dart';

class SignUpFragment extends StatelessWidget {
  static TextEditingController _nameController = TextEditingController();
  static TextEditingController _phoneController = TextEditingController();
  static TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    HomeInherited homeInherited = HomeInherited.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LogoBar(),
        Container(
          margin: EdgeInsets.only(
            right: HelperUI.largePadding,
            left: HelperUI.largePadding,
            top: HelperUI.largePadding,
          ),
          child: CustomInput(
            editingController: _nameController,
            hintText: homeInherited.languages.getText("enterName"),
            inputIcon: Image.asset(
              "assets/person.png",
              width: 20,
              height: 20,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            right: HelperUI.largePadding,
            left: HelperUI.largePadding,
            top: HelperUI.largePadding,
          ),
          child: CustomInput(
            editingController: _phoneController,
            hintText: homeInherited.languages.getText("enterPhone"),
            inputIcon: Image.asset(
              "assets/phone.png",
              width: 20,
              height: 20,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            right: HelperUI.largePadding,
            left: HelperUI.largePadding,
            top: HelperUI.largePadding,
            bottom: HelperUI.extraLargePadding,
          ),
          child: CustomInput(
            editingController: _passwordController,
            hintText: homeInherited.languages.getText("enterPassword"),
            inputIcon: Image.asset(
              "assets/password.png",
              width: 20,
              height: 20,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              right: HelperUI.largePadding,
              left: HelperUI.largePadding,
              top: HelperUI.largePadding,
              bottom: HelperUI.largePadding),
          child: MainButton(
            buttonText: homeInherited.languages.getText("createAccount"),
            buttonType: ButtonType.primary,
            buttonFunction: () {},
          ),
        ),
        InkWell(
          onTap: () => goToLoginFragment(context),
          child: Text(
            homeInherited.languages.getText("alreadyExist"),
            style: homeInherited.ui.normalTextStyle
                ?.copyWith(color: homeInherited.ui.hintColor),
          ),
        ),
      ],
    );
  }

  goToLoginFragment(BuildContext context) => LoginInherit.of(context)!.loginController.changePage = LoginFragment();

  validPhone(String phoneText) {
    if (phoneText.length == 11) {
      int phone;
      try {
        phone = int.parse(phoneText);
      } on Exception {
        return -1;
      }
      if (phoneText.substring(0, 2) != "07") {
        return -1;
      } else {
        return phone;
      }
    }
    //
    else if (phoneText.length == 10) {
      int phone;
      try {
        phone = int.parse(phoneText);
      } on Exception {
        return -1;
      }
      if (phoneText.substring(0, 1) != "7") {
        return -1;
      } else {
        return phone;
      }
    }
    //
    else if (phoneText.length == 15) {
      int phone;
      try {
        phone = int.parse(phoneText.substring(5));
      } on Exception {
        return -1;
      }
      if (phoneText.substring(0, 5) != "00964") {
        return -1;
      } else {
        return phone;
      }
    } else {
      return -1;
    }
  }

}