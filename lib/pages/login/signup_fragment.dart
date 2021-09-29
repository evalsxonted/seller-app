import 'package:flutter/material.dart';
import 'package:seller/widgets/button_main.dart';
import 'package:seller/widgets/clickable_text.dart';
import 'package:seller/widgets/home_wrapper.dart';
import 'login_fragment_w.dart';
import 'login_input.dart';
import 'login_w.dart';
import 'logo_bar.dart';

class SignUpFragment extends StatefulWidget {
  @override
  _SignUpFragmentState createState() => _SignUpFragmentState();
}

class _SignUpFragmentState extends State<SignUpFragment> {
  late final TextEditingController _nameController;

  late final TextEditingController _phoneController;

  late final TextEditingController _passwordController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    HomeInherited homeInherited = HomeInherited.of(context)!;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LogoBar(),
          LoginInput(
            inputController: _nameController,
            hintText: homeInherited.languages.getText("enterName"),
            imageSrc: "assets/person.png",
          ),
          LoginInput(
            inputController: _phoneController,
            hintText: homeInherited.languages.getText("enterPhone"),
            imageSrc: "assets/phone.png",
          ),
          LoginInput(
            inputController: _passwordController,
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
              buttonFunction: () {},
            ),
          ),
          ClickableText(
            text: homeInherited.languages.getText("alreadyExist"),
            textAction: goToLoginFragment,
          ),
        ],
      ),
    );
  }

  goToLoginFragment() =>
      LoginInherit.of(context)!.loginController.setFragment = LoginFragment();

}
