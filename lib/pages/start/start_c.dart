import 'package:flutter/material.dart';
import 'package:seller/utilities/hive_prefs.dart';

enum StartPage { wait, welcome, home }

class StartPageController {
   final ValueNotifier<StartPage> startPageNotifier =
      ValueNotifier<StartPage>(StartPage.wait);

   static StartPageController? _singleton;

   StartPageController._(){

     _checkLogged();
   }

   static StartPageController get singleton {
     return _singleton ??= StartPageController._();
   }

  void setPage(StartPage newPage) {
    startPageNotifier.value = newPage;
  }

  StartPage get getPage => startPageNotifier.value;
  

  _checkLogged() {
    if (HivePrefs.singleton?.getLogged ?? false) {
      setPage(StartPage.home);
    } else {
      setPage(StartPage.welcome);
    }
  }
}
