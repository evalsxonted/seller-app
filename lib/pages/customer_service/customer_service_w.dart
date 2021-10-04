import 'package:flutter/material.dart';
import 'package:seller/models/message.dart';
import 'package:seller/pages/customer_service/image_message.dart';
import 'package:seller/pages/customer_service/sending_row.dart';
import 'package:seller/utilities/langauges.dart';
import 'package:seller/utilities/ui_helper.dart';
import 'package:seller/widgets/appbar_global.dart';
import 'package:seller/widgets/home_wrapper.dart';
import 'customer_service_c.dart';

class CustomerService extends StatefulWidget {
  @override
  _CustomerServiceState createState() => _CustomerServiceState();
}

class _CustomerServiceState extends State<CustomerService> {
  late final CustomerServiceController csController;

  @override
  void initState() {
    csController = CustomerServiceController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HelperUI ui = HomeInherited.of(context)!.ui;
    Languages languages = HomeInherited.of(context)!.languages;
    return Scaffold(
      backgroundColor: ui.bgColor,
      appBar: AppBarGlobal(
        title: languages.getText("support"),
      ),
      body: SafeArea(
          child: StreamBuilder(
              stream: csController.messagesStream.stream,
              builder: (_, AsyncSnapshot<MessageInfo> newMessage) {
                return Padding(
                  padding: EdgeInsets.all(ui.largePadding),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      csController.messages.length == 0
                          ? Expanded(
                              child: Container(
                              margin: EdgeInsets.all(ui.largePadding),
                              child: Text(
                                languages.getText("welcomingText"),
                                style: ui.bigTitleTextStyle,
                                textAlign: TextAlign.center,
                              ),
                            ))
                          : Expanded(
                              child: ListView.builder(
                                reverse: true,
                                controller: csController.listScrollController,
                                itemCount: csController.messages.length,
                                itemBuilder: (context, index) {
                                  MessageInfo message =
                                      csController.messages[index];
                                  return Container(
                                    alignment: message.adminMessage
                                        ? AlignmentDirectional.centerEnd
                                        : AlignmentDirectional.centerStart,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        bottom: ui.normalPadding,
                                      ),
                                      padding: EdgeInsets.all(ui.smallPadding),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(ui.largePadding)),
                                          color: Theme.of(context).canvasColor),
                                      child: message.image == null
                                          ? Text(message.message,
                                              style: ui.normalTextStyle)
                                          : ImageMessage(message: message),
                                    ),
                                  );
                                },
                              ),
                            ),
                      ValueListenableBuilder(
                          valueListenable: csController.adminReadNotifier,
                          builder: (context, bool read, child) => read
                              ? Text(languages.getText("seen"),
                                  style: ui.smallTextStyle)
                              : Container()),
                      SendingRow(
                        csController: csController,
                      ),
                    ],
                  ),
                );
              })),
    );
  }
}
