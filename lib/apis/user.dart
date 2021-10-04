import 'package:flutter/services.dart';
import 'package:seller/models/user.dart';


class UserAPI{
  static String getUserApi = "assets/json/user.json";
  static String updateUserApi = "www.example.com/user/update/";
  static String updateUserPasswordApi = "www.example.com/user/updatePassword/";
  static String deleteUserApi = "www.example.com/user/delete/";
  static String newUserApi = "www.example.com/user/new/";

  Future<User?> getUser(String phone) async {
    // Uri url = Uri.parse(getUserApi+ "/$phone");
    // http.Response response = await http.get(url);
    // ResponseHandler responseHandler = ResponseHandler(response);
    // if(responseHandler.isUsable()){
    //   return User.fromMap(responseHandler.bodyDecoded);
    // }else {
    //   return null;
    // }
    /*
    */
    // for testing we use local json file:
    String jsonData = await rootBundle.loadString(getUserApi);
    return User.fromJson(jsonData);
  }

  Future<bool> addUser(User user) async {
    // Uri url = Uri.parse(newUserApi);
    // http.Response response = await http.post(url, body: user.jsonFromUser());
    // ResponseHandler responseHandler = ResponseHandler(response);
    // if(responseHandler.isUsable()){
    //   return true;
    // }else {
    //   return false;
    // }
    /*
    */
    // for testing return true:
    return true;
  }

  Future<bool> updateUser(User updatedUser) async {
    // Uri url = Uri.parse(updateUserApi);
    // http.Response response = await http.post(url, body: updatedUser.jsonFromUser());
    // ResponseHandler responseHandler = ResponseHandler(response);
    // if(responseHandler.isUsable()){
    //   return true;
    // }else {
    //   return false;
    // }
    /*
    */
    // for testing return true:
    return true;
  }

  Future<bool> updateUserPassword(String updatedPassword) async {
    // Map data = {
    //   "password": updatedPassword
    // };
    // Uri url = Uri.parse(updateUserPasswordApi);
    // http.Response response = await http.post(url, body: jsonEncode(data));
    // ResponseHandler responseHandler = ResponseHandler(response);
    // if(responseHandler.isUsable()){
    //   return true;
    // }else {
    //   return false;
    // }
    /*
     */
    // for testing return true:
    return true;
  }


}