

import 'package:seller/utilities/phone_number_handler.dart';

class VerificationSMS{
  String phoneNumber;
  late final PhoneNumberHandler phoneNumberHandler;
  VerificationSMS(this.phoneNumber){
    phoneNumberHandler = PhoneNumberHandler(phoneNumber);
  }


  Future<String?> sendVerification() async {
    if(!phoneNumberHandler.checkValidPhone()){
      return null;
    }
    bool eligible = await _isDeviceEligible();
    bool repetitive = await _repetitiveRequests();
    if(eligible && !repetitive){
      //send sms code to global number
      // int globalPhoneNumber = phoneNumberHandler.getGlobalPhoneNumber();
      return "code";
    }else{
      return null;
    }
  }
  Future<bool> _isDeviceEligible() async {
    await Future.delayed(Duration(seconds: 1));
    return true;
    //else
    // return false;
  }
  Future<bool> _repetitiveRequests() async {
    await Future.delayed(Duration(seconds: 1));
    // return true;
    //else
    return false;
  }
}