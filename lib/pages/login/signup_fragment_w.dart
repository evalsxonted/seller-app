import 'package:flutter/material.dart';
import 'package:seller/pages/login/signup_fragment_c.dart';
import 'package:seller/widgets/button_main.dart';
import 'package:seller/widgets/clickable_text.dart';
import 'package:seller/widgets/home_wrapper.dart';
import 'package:seller/widgets/input.dart';
import 'login_input.dart';
import 'logo_bar.dart';

class SignUpFragment extends StatefulWidget {
  @override
  _SignUpFragmentState createState() => _SignUpFragmentState();
}

class _SignUpFragmentState extends State<SignUpFragment> {
  late final SignUpController signUpController;
  @override
  void initState() {
    signUpController = SignUpController(context);
    super.initState();
  }

  @override
  void dispose() {
    signUpController.nameController.dispose();
    signUpController.phoneController.dispose();
    signUpController.passwordController.dispose();
    signUpController.codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    HomeInherited homeInherited = HomeInherited.of(context)!;
    return SingleChildScrollView(
      child:  ValueListenableBuilder(
        valueListenable: signUpController.verificationRequestedNotifier,
        builder: (_, bool verificationRequested, __) {
        return AnimatedSwitcher(
          duration: Duration(seconds: 1),
          child: verificationRequested ?
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LogoBar(),
              Padding(
                padding: EdgeInsets.all(homeInherited.ui.largePadding),
                child: Text(
                  homeInherited.languages
                      .getText("enterVerificationCodeMessage"),
                  style: homeInherited.ui.normalTextStyle,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  right: homeInherited.ui.largePadding,
                  left: homeInherited.ui.largePadding,
                  top: homeInherited.ui.largePadding,
                ),
                child: CustomInput(
                  editingController: signUpController.codeController,
                  hintText:
                  homeInherited.languages.getText("enterVerificationCode"),
                  inputIcon: Icon(
                    Icons.verified,
                    color: homeInherited.ui.iconColor,
                  ),
                ),
              ),
              SizedBox(
                height: homeInherited.ui.extraLargePadding,
              ),
              Container(
                margin: EdgeInsets.only(
                    right: homeInherited.ui.largePadding,
                    left: homeInherited.ui.largePadding,
                    top: homeInherited.ui.largePadding,
                    bottom: homeInherited.ui.largePadding),
                child: MainButton(
                  buttonText: homeInherited.languages.getText("verify"),
                  buttonType: ButtonType.primary,
                  buttonFunction: signUpController.verifyAction,
                ),
              ),
              ClickableText(
                text: homeInherited.languages.getText("alreadyExist"),
                textAction: signUpController.goToLoginFragment,
              ),
            ],
          ) : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LogoBar(),
              LoginInput(
                inputController: signUpController.nameController,
                hintText: homeInherited.languages.getText("enterName"),
                imageSrc: "assets/person.png",
              ),
              LoginInput(
                inputController: signUpController.phoneController,
                hintText: homeInherited.languages.getText("enterPhone"),
                imageSrc: "assets/phone.png",
              ),
              LoginInput(
                inputController: signUpController.passwordController,
                hintText: homeInherited.languages.getText("enterPassword"),
                imageSrc: "assets/password.png",
              ),
              SizedBox(
                height: homeInherited.ui.extraLargePadding,
              ),
              Container(
                margin: EdgeInsets.only(
                    right: homeInherited.ui.largePadding,
                    left: homeInherited.ui.largePadding,
                    top: homeInherited.ui.largePadding,
                    bottom: homeInherited.ui.largePadding),
                child: MainButton(
                  buttonText: homeInherited.languages.getText("createAccount"),
                  buttonType: ButtonType.primary,
                  buttonFunction: signUpController.createAccountAction,
                ),
              ),
              ClickableText(
                text: homeInherited.languages.getText("alreadyExist"),
                textAction: signUpController.goToLoginFragment,
              ),
            ],
          ),
        );
      },)
    );
  }


}
