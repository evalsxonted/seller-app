import 'package:flutter/material.dart';
import 'package:seller/pages/start/material_app_props_controller.dart';
import 'package:seller/utilities/langauges.dart';
import 'package:seller/utilities/ui_helper.dart';
import 'package:seller/widgets/button_main.dart';
import 'package:seller/widgets/input.dart';

class LoginFragment extends StatelessWidget {
  final HelperUI _ui = HelperUI(PropsHandler.getContext);
  final Languages _languages = Languages(PropsHandler.singleton.getLocale);
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
        return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: _ui.maxWidth,
          margin: EdgeInsets.only(
              left: HelperUI.largePadding,
              top: HelperUI.extraLargePadding,
              right: HelperUI.largePadding,
              bottom: HelperUI.extraLargePadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/logo.png",
                width: 50,
                height: 50,
              ),
              Text(
                  _languages.getText("logo"),
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    ?.copyWith(color: Theme.of(context).hintColor),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            right: HelperUI.largePadding,
            left: HelperUI.largePadding,
            top: HelperUI.largePadding,
          ),
          child: CustomInput(
            editingController: phoneController,
            hintText:                   _languages.getText("logo"),
            inputIcon: Image.asset(
              "assets/phone.png",
              width: 20,
              height: 20,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              right: HelperUI.largePadding,
              left: HelperUI.largePadding,
              top: HelperUI.largePadding,
              bottom: HelperUI.largePadding),
          child: CustomInput(
            editingController: passwordController,
            hintText: _languages.getText("enterPassword"),
            inputIcon: Image.asset(
              "assets/password.png",
              width: 20,
              height: 20,
            ),
          ),
        ),
        InkWell(
          onTap: () { },
          child: Text(
            _languages.getText("forgotPassword"),
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(color: Theme.of(context).hintColor),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              right: HelperUI.largePadding, left: HelperUI.largePadding, top: HelperUI.largePadding, bottom: HelperUI.largePadding),
          child: MainButton(
            buttonText: _languages.getText("login"),
            buttonType: ButtonType.primary,
            buttonFunction: (){},
          ),
        ),
        InkWell(
          onTap: (){},
          child: Text(
            _languages.getText("newAccount"),
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(color: Theme.of(context).hintColor),
          ),
        ),
      ],
    );

  }
}



