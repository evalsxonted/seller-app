import 'package:flutter/material.dart';
import 'package:seller/models/request.dart';
import 'package:seller/utilities/langauges.dart';
import 'package:seller/utilities/ui_helper.dart';
import 'package:seller/widgets/appbar_global.dart';
import 'package:seller/widgets/home_wrapper.dart';

import 'request_card.dart';
import 'requests_c.dart';

class MyRequests extends StatefulWidget {
  @override
  _MyRequestsState createState() => _MyRequestsState();
}

class _MyRequestsState extends State<MyRequests> {
  // requested - confirmed - bought - shipped - sent - delivered - missed
  late final RequestController requestController ;

  @override
  void initState() {
    requestController = RequestController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HelperUI ui = HomeInherited.of(context)!.ui;
    Languages languages = HomeInherited.of(context)!.languages;
    return Scaffold(
      backgroundColor: ui.bgColor,
      appBar: AppBarGlobal(title: languages.getText("myRequests")),
      body: FutureBuilder(
        future: requestController.getRequests(),
        builder: (context, AsyncSnapshot<List<RequestInfo>> requestsSnapshot) {
        if(!requestsSnapshot.hasData){
          return Center(
            child: CircularProgressIndicator(color: ui.hintColor,),
          );
        }else{
          if(requestsSnapshot.data?.length == 0){
            return Center(
                child: Text(
                  languages.getText("emptyRequests"),
                  style: Theme.of(context).textTheme.headline4,
                ),
            );
          }else{
            return ListView.builder(
                itemCount: requestsSnapshot.data?.length,
                itemBuilder: (cntx, index) {
                  return RequestCard(
                    requestInfo: requestsSnapshot.data![index],
                  );
                });
          }
        }
      },
      ),
    );
  }

}
