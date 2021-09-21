import 'package:flutter/material.dart';

import 'login_fragment.dart';

class LoginController{
  ValueNotifier<Widget> _loginFragment = ValueNotifier<Widget>(LoginFragment());
  ValueNotifier<Widget> get fragmentNotifier => _loginFragment;
  Widget get currentPage => _loginFragment.value;
  set changePage(Widget newFragment) => _loginFragment.value = newFragment;
}