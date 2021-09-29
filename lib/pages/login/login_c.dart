import 'package:flutter/material.dart';

import 'login_fragment_w.dart';


class LoginController{
  ValueNotifier<Widget> _loginFragment = ValueNotifier<Widget>(LoginFragment());
  ValueNotifier<Widget> get fragmentNotifier => _loginFragment;
  Widget get currentPage => _loginFragment.value;
  set setFragment(Widget newFragment) => _loginFragment.value = newFragment;
  int forgotInitialPage = 0;

}