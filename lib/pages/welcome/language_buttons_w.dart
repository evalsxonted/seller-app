import 'package:flutter/material.dart';
import 'package:seller/pages/start/material_app_props_controller.dart';
import 'package:seller/pages/welcome/lanugae_buttons_c.dart';
import 'package:seller/utilities/langauges.dart';
import 'package:seller/utilities/locale_provider.dart';
import 'package:seller/utilities/ui_helper.dart';

class LanguageButtons extends StatelessWidget {
  final LangBtnController _langBtn = LangBtnController();
  final HelperUI _ui =  HelperUI(PropsHandler.getContext);
  final Languages _languages = Languages(PropsHandler.singleton.getLocale);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _langBtn
          .langButtonNotifier,
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
                      color: _ui.langButtonColor
                          .withAlpha(
                          PropsHandler.singleton.getLocale ==
                              LocaleProvider.arabicLocale ? 255 : 100),
                    ),
                    child: Text(
                      "ar",
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyText2,
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
                      color: _ui.langButtonColor
                          .withAlpha(
                          PropsHandler.singleton.getLocale ==
                              LocaleProvider.englishLocale ? 255 : 100),
                    ),
                    child: Text(
                      "en",
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyText2,
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
            ),
            child: InkWell(
              onTap: () {
                _langBtn.setLangPressed = true;
              },
              child: Row(
                children: [
                  Icon(
                    Icons.language_outlined,
                    color: Theme
                        .of(context)
                        .primaryColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    _languages.getText("language"),
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyText2,
                  ),
                ],
              ),
            ),
          );
        }
      },);
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
