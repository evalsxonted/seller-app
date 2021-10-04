import 'dart:io';

import 'package:flutter/services.dart';
import 'package:seller/models/message.dart';

class MessageAPI{
  static String getMessagesAPI = "assets/json/messages.json";
  static String sendMessageAPI = "www.example.com/user/send/";
  static String uploadImageAPI = "www.example.com/user/upload/";

  Future<List<MessageInfo>?> getMessages(int userPhone) async {
    // Uri url = Uri.parse(getMessagesAPI+ "$userPhone");
    // http.Response response = await http.get(url);
    // ResponseHandler responseHandler = ResponseHandler(response);
    // if(responseHandler.isUsable()){
    //   return MessageInfo.fromMapList(responseHandler.bodyDecoded);
    // }else {
    //   return null;
    // }
    /*
    */
    // for testing we use local json file:
    String jsonData = await rootBundle.loadString(getMessagesAPI);
    return MessageInfo.fromJsonList(jsonData);
  }
  Future<bool> sendMessage(MessageInfo messageInfo) async {
    /*
    */
    // for testing we return true:
    return true;
  }
  Future<String?> uploadImage(File image, int userPhone) async {
    // String fileName = userPhone.toString() + " - " + DateTime.now().toIso8601String() ;

    /*
    */
    // for testing we return:
    return "image url";
  }
}