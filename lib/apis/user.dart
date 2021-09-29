import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:seller/APIS/response_handler.dart';
import 'package:seller/models/user.dart';


class UserAPI{
  static String getUserApi = "www.example.com/user/get/";
  static String updateUserApi = "www.example.com/user/update/";
  static String updateUserPasswordApi = "www.example.com/user/updatePassword/";
  static String deleteUserApi = "www.example.com/user/delete/";
  static String newUserApi = "www.example.com/user/new/";

  Future<User?> getUser() async {
    Uri url = Uri.parse(getUserApi);
    http.Response response = await http.get(url);
    ResponseHandler responseHandler = ResponseHandler(response);
    if(responseHandler.isUsable()){
      return User.fromMap(responseHandler.bodyDecoded);
    }else {
      return null;
    }
  }
  Future<bool> updateUser(User updatedUser) async {
    Uri url = Uri.parse(updateUserApi);
    http.Response response = await http.post(url, body: updatedUser.jsonFromUser());
    ResponseHandler responseHandler = ResponseHandler(response);
    if(responseHandler.isUsable()){
      return true;
    }else {
      return false;
    }
  }

  Future<bool> updateUserPassword(String updatedPassword) async {
    Map data = {
      "password": updatedPassword
    };
    Uri url = Uri.parse(updateUserPasswordApi);
    http.Response response = await http.post(url, body: jsonEncode(data));
    ResponseHandler responseHandler = ResponseHandler(response);
    if(responseHandler.isUsable()){
      return true;
    }else {
      return false;
    }
  }


}