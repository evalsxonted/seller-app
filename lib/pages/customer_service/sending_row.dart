import 'package:flutter/material.dart';
import 'package:seller/pages/customer_service/customer_service_c.dart';
import 'package:seller/widgets/home_wrapper.dart';

class SendingRow extends StatelessWidget {
  final CustomerServiceController csController;
  SendingRow({Key? key,required this.csController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeInherited homeInherited = HomeInherited.of(context)!;

    return Container(
      height: 60,
      padding: EdgeInsets.only(bottom: homeInherited.ui.smallPadding,
          left: homeInherited.ui.smallPadding, right: homeInherited.ui.smallPadding),
      child: Container(
        padding: EdgeInsets.only(left: homeInherited.ui.normalPadding),
        decoration: BoxDecoration(
          color: homeInherited.ui.cardColor,
          borderRadius: BorderRadius.circular(homeInherited.ui.largePadding),
        ),
        width: homeInherited.ui.maxWidth,
        child: TextField(
          style: homeInherited.ui.normalTextStyle,
          controller: csController.messageController,
          decoration: InputDecoration(
            hintText: homeInherited.languages.getText("sendMessageHint"),
            border: InputBorder.none,
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    icon: Image.asset("assets/image.png",height: 25, width: 25,),
                    onPressed: () {
                      csController.sendImage(csController.messageController.text);
                    }),
                IconButton(
                    icon: Image.asset("assets/send.png", height: 25, width: 25,),
                    onPressed: () {
                      csController.sendMessage(csController.messageController.text);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
