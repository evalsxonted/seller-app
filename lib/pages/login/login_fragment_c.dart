import 'package:flutter/material.dart';
import 'package:seller/apis/user.dart';
import 'package:seller/models/user.dart';

import 'forgot_fragment_w.dart';
import 'login_w.dart';
import 'signup_fragment.dart';

class LoginFragmentController{
  late final TextEditingController phoneController;
  late final TextEditingController passwordController;
  final BuildContext context;
  LoginFragmentController(this.context){
    phoneController = TextEditingController();
    passwordController = TextEditingController();
  }

  goToSignUpFragment() =>
      LoginInherit.of(context)!.loginController.setFragment = SignUpFragment();

  goToForgotFragment() =>
      LoginInherit.of(context)!.loginController.setFragment = ForgotFragment(
          forgotInitialPage:
          LoginInherit.of(context)!.loginController.forgotInitialPage);
  loginAction() async {
    User? user = await UserAPI().getUser();
    //todo add user to sqlite
    if(user!=null){
      Navigator.pushReplacementNamed(context, "/home");
    }
  }
}