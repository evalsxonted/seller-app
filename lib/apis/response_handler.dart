import 'dart:convert';

import 'package:http/http.dart';

class ResponseHandler{
  final Response _response;
  ResponseHandler(this._response);
  bool isUsable(){
    if(_response.statusCode >=200 && _response.statusCode < 300){
      return true;
    }else{
      _logFailure();
      return false;
    }
  }
  _logFailure() {
    //log failure reason and send info to developer
    // response.statusCode
    // response.reasonPhrase
  }
  get bodyDecoded => jsonDecode(_response.body);

}