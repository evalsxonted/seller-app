import 'package:flutter/material.dart';

import '../db/hive_prefs.dart';

class LocaleProvider{
   static  Locale englishLocale = Locale("en", "US");
   static Locale arabicLocale = Locale("ar", "IQ");



  Locale get getLocale {
    List? locale = HivePrefs.singleton?.getLocale.split("-");
    if(locale != null){
      return Locale(locale[0],locale[1]);
    }else{
      return Locale("en","US");
    }
  }

  saveLocale(Locale newLocale){
      HivePrefs.singleton?.setLocale(newLocale);
  }

}