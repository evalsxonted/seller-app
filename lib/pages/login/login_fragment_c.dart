
import 'package:flutter/material.dart';
import 'package:seller/apis/user.dart';
import 'package:seller/db/db_init/sqlite_db_init.dart';
import 'package:seller/db/hive_prefs.dart';
import 'package:sqflite/sqflite.dart';
import '../../db/user_sqlite.dart';
import 'package:seller/models/user.dart';
import 'package:seller/utilities/phone_number_handler.dart';
import 'package:seller/widgets/home_wrapper.dart';
import 'package:seller/widgets/snackbar_text.dart';

import 'forgot_fragment_w.dart';
import 'login_w.dart';
import 'signup_fragment_w.dart';

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
    LoginInherit.of(context)!.overlayController.setActive = true;
    if(!PhoneNumberHandler(phoneController.text.trim()).checkValidPhone()){
      showSnackBar("notValidNumber");
    }else{
      User? user = await UserAPI().getUser(phoneController.text.trim());
      if(user!=null){
        if(user.password == passwordController.text.trim()){
          Database sqlite = await Sqlite().initDatabase();
          UserDB(sqlite).addUser(user).then((bool successful) {
            if(successful){
              HivePrefs.singleton?.setUserPhone(user.phone);
              HivePrefs.singleton?.setLogged(true);
              Navigator.pushReplacementNamed(context, "/central");
            }else{
              showSnackBar("errorAddingUser");
            }
            sqlite.close();
          });
        }else{
          showSnackBar("wrongPassword");
        }
      }else{
        showSnackBar("errorGettingUserInfo");
      }
    }
    LoginInherit.of(context)!.overlayController.setActive = false;
  }
   void showSnackBar(String messageCode){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: MySnackBarContent(
          snackText:
          HomeInherited.of(context)!.languages.getText(messageCode),
        ),
        backgroundColor: HomeInherited.of(context)!.ui.highlightColor,
      ),
    );
  }
}