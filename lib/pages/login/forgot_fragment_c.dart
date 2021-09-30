import 'package:flutter/material.dart';
import 'package:seller/APIS/user_api.dart';
import 'package:seller/utilities/sms_verification.dart';
import 'package:seller/widgets/home_wrapper.dart';
import 'package:seller/widgets/snackbar_text.dart';
import 'login_fragment_w.dart';
import 'login_w.dart';

class ForgotController {
  late final TextEditingController phoneController;
  late final TextEditingController codeController;
  late final TextEditingController newPassController;
  late final PageController forgotPageController;
  late final BuildContext context;
  ForgotController(this.context, int initialPage) {
    forgotPageController = PageController(initialPage: 0);
    phoneController = TextEditingController();
    codeController = TextEditingController();
    newPassController = TextEditingController();
  }

  String? resetCode;

  set setForgotPage(int pageIndex) =>
      forgotPageController.animateToPage(pageIndex,
          duration: Duration(seconds: 1), curve: Curves.ease);

  sendVerificationAction() {
    LoginInherit.of(context)!.overlayController.setActive = true;
    VerificationSMS(phoneController.text.trim())
        .sendVerification()
        .then((String? result) {
      if (result != null) {
        resetCode = result;
        LoginInherit.of(context)!.loginController.forgotInitialPage = 1;
        setForgotPage = 1;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: MySnackBarContent(
              snackText: HomeInherited.of(context)!
                  .languages
                  .getText("errorSendingVerification"),
            ),
            backgroundColor: HomeInherited.of(context)!.ui.highlightColor,
          ),
        );
      }
      LoginInherit.of(context)!.overlayController.setActive = false;
    });
  }

  verifyResetCode() {
    if (resetCode == codeController.text.trim()) {
      LoginInherit.of(context)!.loginController.forgotInitialPage = 2;
      setForgotPage = 2;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: MySnackBarContent(
            snackText:
            HomeInherited.of(context)!.languages.getText("wrongCode"),
          ),
          backgroundColor: HomeInherited.of(context)!.ui.highlightColor,
        ),
      );
    }
  }

  newPasswordAction() {
    LoginInherit.of(context)!.overlayController.setActive = true;
    UserAPI().updateUserPassword(newPassController.text.trim()).then((bool successful){
      if(successful){
        LoginInherit.of(context)!.loginController.forgotInitialPage = 3;
        setForgotPage = 3;
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: MySnackBarContent(
              snackText:
              HomeInherited.of(context)!.languages.getText("errorUpdating"),
            ),
            backgroundColor: HomeInherited.of(context)!.ui.highlightColor,
          ),
        );
      }
      LoginInherit.of(context)!.overlayController.setActive = false;
    });
  }

  cancelAction() {
    LoginInherit.of(context)!.loginController.setFragment = LoginFragment();
  }


}
