import 'package:flutter/material.dart';



class ForgotController{
  ForgotController(int initialPage){
    _forgotPageController = PageController(initialPage: initialPage);
  }
  late final PageController _forgotPageController;
  PageController get forgotPageController => _forgotPageController;
  set setForgotPage(int pageIndex) => _forgotPageController.animateToPage(pageIndex, duration: Duration(seconds: 1), curve: Curves.ease);
  Future<bool> sendVerification() async {
    //if verification sent successfully
    return true;
    //else
    //return false;
  }

}