import 'package:flutter/material.dart';
import 'package:seller/pages/start/material_app_props_controller.dart';
import 'lanugae_buttons_c.dart';
import 'package:seller/utilities/locale_provider.dart';
import 'package:seller/widgets/home_wrapper.dart';

class LanguageButtons extends StatelessWidget {
  final LangBtnController _langBtn = LangBtnController();

  @override
  Widget build(BuildContext context) {
    HomeInherited homeInherited = HomeInherited.of(context)!;
    return ValueListenableBuilder(
      valueListenable: _langBtn.langButtonNotifier,
      builder: (_, value, ___) {
        if (value as bool == true) {
          return Container(
            margin: EdgeInsets.only(
              left: 10,
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: arButtonAction,
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(20),
                          bottomStart: Radius.circular(20)),
                      color: homeInherited.ui.langButtonColor.withAlpha(
                          PropsHandler.singleton.getLocale ==
                                  LocaleProvider.arabicLocale
                              ? 255
                              : 100),
                    ),
                    child: Text(
                      "ar",
                      style: homeInherited.ui.smallTextStyle,
                    ),
                  ),
                ),
                InkWell(
                  onTap: enButtonAction,
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.only(
                          topEnd: Radius.circular(20),
                          bottomEnd: Radius.circular(20)),
                      color: homeInherited.ui.langButtonColor.withAlpha(
                          PropsHandler.singleton.getLocale ==
                                  LocaleProvider.englishLocale
                              ? 255
                              : 100),
                    ),
                    child: Text(
                      "en",
                      style: homeInherited.ui.smallTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container(
            margin: EdgeInsets.only(
              left: 10,
              right: 10
            ),
            child: InkWell(
              onTap: () {
                _langBtn.setLangPressed = true;
              },
              child: Row(
                children: [
                  Text(
                    homeInherited.languages.getText("language"),
                    style: homeInherited.ui.normalTextStyle,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.language_outlined,
                    color: homeInherited.ui.iconColor,
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  enButtonAction() {
    _langBtn.setLangPressed = false;
    PropsHandler.singleton.setLocale(LocaleProvider.englishLocale);
  }

  arButtonAction() {
    _langBtn.setLangPressed = false;
    PropsHandler.singleton.setLocale(LocaleProvider.arabicLocale);
  }

}