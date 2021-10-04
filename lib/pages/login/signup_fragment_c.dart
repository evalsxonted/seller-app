import 'dart:io';

import 'package:flutter/material.dart';
import 'package:seller/apis/user.dart';
import 'package:seller/db/db_init/sqlite_db_init.dart';
import 'package:seller/db/hive_prefs.dart';
import 'package:sqflite/sqflite.dart';
import '../../db/user_sqlite.dart';
import 'package:seller/models/user.dart';
import 'package:seller/utilities/phone_number_handler.dart';
import 'package:seller/utilities/sms_verification.dart';
import 'package:seller/widgets/home_wrapper.dart';
import 'package:seller/widgets/snackbar_text.dart';

import 'login_fragment_w.dart';
import 'login_w.dart';

class SignUpController {
  late final TextEditingController nameController;
  late final TextEditingController phoneController;
  late final TextEditingController passwordController;
  late final TextEditingController codeController;
  late final ValueNotifier<bool> verificationRequestedNotifier ;
  String? verificationCode;
  final BuildContext context;
  SignUpController(this.context) {
    verificationRequestedNotifier = ValueNotifier<bool>(false);
    nameController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    codeController = TextEditingController();
  }

  goToLoginFragment() =>
      LoginInherit.of(context)!.loginController.setFragment = LoginFragment();

  createAccountAction() async {
    LoginInherit.of(context)!.overlayController.setActive = true;
    PhoneNumberHandler phoneNumberHandler =
        PhoneNumberHandler(phoneController.text.trim());
    if (!phoneNumberHandler.checkValidPhone()) {
      showSnackBar("notValidNumber");
      LoginInherit.of(context)!.overlayController.setActive = false;
    } else {
      VerificationSMS(phoneController.text.trim())
          .sendVerification()
          .then((String? result) {
        LoginInherit.of(context)!.overlayController.setActive = false;
        if (result != null) {
          verificationCode = result;
          verificationRequestedNotifier.value = true;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: MySnackBarContent(
                snackText: HomeInherited.of(context)!
                    .languages
                    .getText("errorSendingVerification"),
              ),
              backgroundColor: HomeInherited.of(context)!.ui.highlightColor,
            ),
          );
        }
      });
    }
  }
  verifyAction() async {
    PhoneNumberHandler phoneNumberHandler =
    PhoneNumberHandler(phoneController.text.trim());
    if(verificationCode == codeController.text.trim()){
      User user = User(
        device: Platform.operatingSystem + Platform.operatingSystemVersion,
        name: nameController.text.trim(),
        password: passwordController.text.trim(),
        phone: phoneNumberHandler.phoneNumber ?? 0,
        enabled: true,
      );
      //
      bool result = await UserAPI().addUser(user);
      if (result) {
        Database sqlite = await Sqlite().initDatabase();
        UserDB(sqlite)
            .addUser(user)
            .then((bool successful) {
          if (successful) {
            HivePrefs.singleton?.setUserPhone(user.phone);
            HivePrefs.singleton?.setLogged(true);
            Navigator.pushReplacementNamed(context, "/central");
          } else {
            showSnackBar("errorAddingUser");
          }
          sqlite.close();
        });
      }else{
        showSnackBar("errorAddingUser");
      }
    }else{
      showSnackBar("wrongCode");

    }
  }
  void showSnackBar(String messageCode) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: MySnackBarContent(
          snackText: HomeInherited.of(context)!.languages.getText(messageCode),
        ),
        backgroundColor: HomeInherited.of(context)!.ui.highlightColor,
      ),
    );
  }
}
