import 'package:flutter/material.dart';

import 'login_fragment.dart';


class LoginController{
  ValueNotifier<Widget> _loginFragment = ValueNotifier<Widget>(LoginFragment());
  ValueNotifier<Widget> get fragmentNotifier => _loginFragment;
  Widget get currentPage => _loginFragment.value;
  set setFragment(Widget newFragment) => _loginFragment.value = newFragment;
  static checkValidPhone(String phoneText) {
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
  int forgotInitialPage = 0;

}