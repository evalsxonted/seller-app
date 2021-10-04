import 'package:flutter/services.dart';
import 'package:seller/models/request.dart';

class RequestAPI{
  static String getRequestsApi = "assets/json/requests.json";
  static String addRequestApi = "example.com/add/";
  Future<List<RequestInfo>?> getRequests(int userPhone) async {
    // Uri url = Uri.parse(getRequestsApi+ "/$userPhone");
    // http.Response response = await http.get(url);
    // ResponseHandler responseHandler = ResponseHandler(response);
    // if(responseHandler.isUsable()){
    //   return Requests
    // }else {
    //   return null;
    // }
    /*
    */
    // for testing we use local json file:
    String jsonData = await rootBundle.loadString(getRequestsApi);
    return RequestInfo.fromJsonList(jsonData);
  }
  Future<bool> addRequest(RequestInfo requestInfo) async {
    // Uri url = Uri.parse(addRequestApi+ "/$requestInfo.userPhone");
    // http.Response response = await http.get(url);
    // ResponseHandler responseHandler = ResponseHandler(response);
    // if(responseHandler.isUsable()){
    //   return Requests
    // }else {
    //   return null;
    // }
    /*
    */
    // for testing we return true;
    return true;
  }
}