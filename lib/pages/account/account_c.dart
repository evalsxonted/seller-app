import 'package:flutter/material.dart';
import 'package:seller/apis/user.dart';
import 'package:seller/db/db_init/sqlite_db_init.dart';
import 'package:seller/db/hive_prefs.dart';
import 'package:seller/db/user_sqlite.dart';
import 'package:seller/models/user.dart';
import 'package:seller/widgets/home_wrapper.dart';
import 'package:seller/widgets/overlay_c.dart';
import 'package:seller/widgets/snackbar_text.dart';
import 'package:sqflite/sqflite.dart';
class AccountController{
  List<String> englishProvinces = [
    "Erbil",
    "Anbar",
    "Babylon",
    "Baghdad",
    "Basra",
    "Halabja",
    "Duhok",
    "Qadisiyyah",
    "Diyala",
    "Dhi Qar",
    "Sulaymaniyah",
    "Saladin",
    "Kirkuk",
    "Karbala",
    "Muthanna",
    "Maysan",
    "Najaf",
    "Nineveh",
    "Wasit"
  ];
  List<String> arabicProvinces = [
    "أربيل",
    "الأنبار",
    "بابل",
    "بغداد",
    "البصرة",
    "حلبجة",
    "دهوك",
    "القادسية",
    "ديالى",
    "ذي قار",
    "السليمانية",
    "صلاح الدين",
    "كركوك",
    "كربلاء",
    "المثنى",
    "ميسان",
    "النجف",
    "نينوى",
    "واسط",
  ];
  late final ValueNotifier<int> provinceNotifier = ValueNotifier<int>(0) ;
  final TextEditingController cName = TextEditingController();
  final TextEditingController cPassword = TextEditingController();
  final TextEditingController cLocation = TextEditingController();
  final MyOverlayController overlayController = MyOverlayController();
  late User user;
  final BuildContext context;
  AccountController(this.context);
  Future initUser() async {
    Database database = await Sqlite().initDatabase();
    user =  await UserDB(database).getUser(HivePrefs.singleton!.getUserPhone);
    database.close();
    return true;
  }


  changeProvinceAction(String province) {
    provinceNotifier.value = provinceNotifier.value+1;
    user.province = province;
  }

  saveChangesAction() async {
    user.location = cLocation.text.isNotEmpty  ? cLocation.text : user.location;
    user.password = cPassword.text.isNotEmpty ? cPassword.text : user.password;
    user.name = cName.text.isNotEmpty  ? cName.text : user.name;
    Database database = await Sqlite().initDatabase();
    bool localUpdated =await UserDB(database).updateUser(user.phone, user);
    bool serverUpdated = await UserAPI().updateUser(user);
    if(localUpdated && serverUpdated){
      showSnackBar("updatedSuccessfully");
    }else{
      showSnackBar("notUpdated");

    }
  }

  logoutAction() async {
    Navigator.pushNamedAndRemoveUntil(context, "/welcome", (route) => false);
    HivePrefs.singleton!.setLogged(false);
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