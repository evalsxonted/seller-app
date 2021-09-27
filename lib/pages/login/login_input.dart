import 'package:flutter/material.dart';
import 'package:seller/widgets/home_wrapper.dart';
import 'package:seller/widgets/input.dart';

class LoginInput extends StatelessWidget {
  final TextEditingController inputController;
  final String hintText;
  final String imageSrc;
  const LoginInput({Key? key,required this.inputController,required this.hintText,required this.imageSrc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeInherited homeInherited = HomeInherited.of(context)!;
    return Container(
      margin: EdgeInsets.only(
        right: homeInherited.ui.largePadding,
        left: homeInherited.ui.largePadding,
        top: homeInherited.ui.largePadding,
      ),
      child: CustomInput(
        editingController: inputController,
        hintText: hintText,
        inputIcon: Image.asset(
          imageSrc,
          width: 20,
          height: 20,
        ),
      ),
    );
  }
}
