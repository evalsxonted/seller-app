import 'package:seller/apis/request.dart';
import 'package:seller/db/hive_prefs.dart';
import 'package:seller/models/request.dart';

class RequestController{

  Future<List<RequestInfo>> getRequests() async {
    List<RequestInfo> requests = await RequestAPI().getRequests(HivePrefs.singleton!.getUserPhone);
    return requests;
  }
}