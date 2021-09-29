class PhoneNumberHandler {
  String phoneText;
  int? phoneNumber;

  PhoneNumberHandler(this.phoneText) {
    try {
      phoneNumber = int.parse(phoneText);
    } on Exception {
      phoneNumber = -1;
    }
  }

  int getGlobalPhoneNumber(){
    if (phoneText.length == 11) {
      String globalPhone = "00964" + phoneText.substring(1);
      return int.parse(globalPhone);
    }
    //
    else if (phoneText.length == 10) {
      String globalPhone = "00964" + phoneText;
      return int.parse(globalPhone);
    }
    else {
      return phoneNumber!;
    }
  }
  bool checkValidPhone() {
    if (phoneNumber == -1) {
      return false;
    }
    if (phoneText.length == 11) {
      return _localPhoneCheck1() != -1;
    }
    //
    else if (phoneText.length == 10) {
      return _localPhoneCheck2() != -1;
    }
    //
    else if (phoneText.length == 15) {
      return _globalPhoneCheck() != -1;
    } else {
      return false;
    }
  }

  int _globalPhoneCheck() {
    if (phoneText.substring(0, 5) != "00964") {
      return -1;
    } else {
      return phoneNumber ?? -1;
    }
  }

  int _localPhoneCheck1() {
    if (phoneText.substring(0, 2) != "07") {
      return -1;
    } else {
      return phoneNumber ?? -1;
    }
  }

  int _localPhoneCheck2() {
    if (phoneText.substring(0, 1) != "7") {
      return -1;
    } else {
      return phoneNumber ?? -1;
    }
  }

  //later
  arabicToEnglishNumber() {}
}
