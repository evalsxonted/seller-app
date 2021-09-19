import 'package:flutter/material.dart';
import 'hive_prefs.dart';

class ThemeProvider{

  final darkTheme = ThemeData(
    primarySwatch: Colors.indigo,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    backgroundColor: Color(0xff121321),
    scaffoldBackgroundColor: Color(0xff121321),
    fontFamily: "Cairo",
    primaryColor: Color(0xffFC2861),
    accentColor: Color(0xff03EBA3),
    cardColor: Color(0xff272941),
    hintColor: Color(0xff636696),
    canvasColor: Color(0xff1B1C30),
    highlightColor: Color(0xffF5FBFF),
    dialogBackgroundColor: Color(0xff35363A),
    textTheme: TextTheme(
      //normal text
      bodyText1: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      bodyText2: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      //titles and headlines
      headline1: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w800,
      ),
      headline2: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      button: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Color(0xffF5FBFF),
      ),
      //caption == hint text
      caption: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
    ).apply(
      bodyColor: Color(0xffF5FBFF),
      displayColor: Color(0xffF5FBFF),
    ),
  );
  final lightTheme = ThemeData(
    primarySwatch: Colors.yellow,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    backgroundColor: Colors.cyanAccent,
    scaffoldBackgroundColor: Colors.blue,
    fontFamily: "Cairo",
    primaryColor: Colors.white,
    accentColor: Color(0xff03EBA3),
    cardColor: Color(0xff272941),
    hintColor: Color(0xff636696),
    canvasColor: Color(0xff1B1C30),
    highlightColor: Color(0xffF5FBFF),
    dialogBackgroundColor: Color(0xff35363A),
    textTheme: TextTheme(
      //normal text
      bodyText1: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      bodyText2: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      //titles and headlines
      headline1: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w800,
      ),
      headline2: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      button: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Color(0xffF5FBFF),
      ),
      //caption == hint text
      caption: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
    ).apply(
      bodyColor: Color(0xffF5FBFF),
      displayColor: Color(0xffF5FBFF),
    ),
  );

  ThemeMode get getThemeMode {
    String? prevTheme = HivePrefs.singleton?.getTheme;
    if(prevTheme == "dark"){
      return ThemeMode.dark;
    }else{
      return ThemeMode.light;
    }
  }

  saveThemeMode(ThemeMode newThemeMode){
    if(newThemeMode == ThemeMode.dark){
      HivePrefs.singleton?.setTheme("dark");
    }else{
      HivePrefs.singleton?.setTheme("light");
    }
  }
}