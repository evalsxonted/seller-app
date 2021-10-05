
import 'package:flutter/material.dart';
import 'package:seller/pages/start/material_app_props_controller.dart';
import 'package:seller/utilities/langauges.dart';
import 'package:seller/utilities/ui_helper.dart';
import 'package:seller/widgets/button_main.dart';
import 'package:seller/widgets/dropdown.dart';
import 'package:seller/widgets/home_wrapper.dart';
import 'package:seller/widgets/input.dart';
import 'package:seller/widgets/language_buttons_w.dart';

import 'account_c.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  late final AccountController accountController ;

  @override
  void dispose() {
    accountController.cName.dispose();
    accountController.cPassword.dispose();
    accountController.cLocation.dispose();
    super.dispose();
  }

  @override
  void initState() {
    accountController = AccountController(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HelperUI ui = HomeInherited.of(context)!.ui;
    Languages languages = HomeInherited.of(context)!.languages;
    return FutureBuilder(
      future: accountController.initUser(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          List<String> provinces = PropsHandler.singleton.getLocale.languageCode == "en" ?
          accountController.englishProvinces : accountController.arabicProvinces;
          return Scaffold(
            backgroundColor: ui.bgColor,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: ui.bgColor,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, size: 30, color: ui.highlightColor,),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              centerTitle: true,
              actions: [
                LanguageButtons(),
              ],
            ),
            body: SingleChildScrollView(
              padding:  EdgeInsets.only(
                  left: ui.largePadding, right: ui.largePadding, top: ui.largePadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: ui.largePadding,
                    ),
                    child: CustomInput(
                      editingController: accountController.cName,
                      hintText: accountController.user.name,
                      inputIcon: Image.asset(
                        "assets/person.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: ui.largePadding,
                    ),
                    child: CustomInput(
                      editingController: TextEditingController(),
                      hintText: accountController.user.phone.toString(),
                      enabled: false,
                      inputIcon: Image.asset(
                        "assets/phone.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: ui.largePadding,
                    ),
                    child: CustomInput(
                      editingController: accountController.cPassword,
                      hintText: " - - - - - - - - ",
                      inputIcon: Image.asset(
                        "assets/password.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                  Container(
                    color: ui.textFieldBgColor,
                    margin: EdgeInsets.only(
                      top: ui.largePadding,
                    ),
                    padding: EdgeInsets.only(
                        left: ui.largePadding, right: ui.largePadding),
                    child: ValueListenableBuilder(valueListenable: accountController.provinceNotifier,
                      builder: (_, int changed, __) {
                      String province = accountController.user.province ?? provinces[0];
                      if(provinces.indexOf(province) == -1){
                          province = provinces[0];
                      }
                      return CustomDropDown(
                        selectedItem: province,
                        items: provinces,
                        hint: languages.getText("province"),
                        onChange: accountController.changeProvinceAction,
                      );
                    },),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: ui.largePadding,
                    ),
                    child: CustomInput(
                      editingController: accountController.cLocation,
                      hintText: accountController.user.location ?? languages.getText("location"),
                      inputIcon: Image.asset(
                        "assets/icons/location2.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ui.extraLargePadding,
                  ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: (ui.maxWidth * 0.5) -
                              ui.extraLargePadding,
                          child: MainButton(
                            buttonType: ButtonType.primary,
                            buttonFunction: accountController.logoutAction,
                            buttonText: languages.getText("logout"),
                          ),
                        ),
                        SizedBox(
                          width: ui.normalPadding,
                        ),
                        Container(
                          width: (ui.maxWidth * 0.5) -
                              ui.extraLargePadding,
                          child: MainButton(
                            buttonType: ButtonType.accent,
                            buttonFunction: accountController.saveChangesAction,
                            buttonText: languages.getText("saveChanges"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ui.extraLargePadding,
                  ),
                ],
              ),
            ),
          );
        }else{
          return Scaffold(
            backgroundColor: ui.bgColor,
            body: Center(
              child: CircularProgressIndicator(color: ui.hintColor,),
            ),
          );
        }
    },);
  }

}
