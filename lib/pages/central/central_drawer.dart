import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seller/utilities/langauges.dart';
import 'package:seller/utilities/ui_helper.dart';
import 'package:seller/widgets/home_wrapper.dart';
import 'package:url_launcher/url_launcher.dart';

import 'central_drawer_item.dart';

class CentralDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HelperUI ui = HomeInherited.of(context)!.ui;
    Languages languages = HomeInherited.of(context)!.languages;
    return Drawer(
      child: Container(
        color: ui.bgColor,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: ui.maxWidth,
                margin: EdgeInsets.only(
                    left: ui.largePadding,
                    top: ui.extraLargePadding,
                    right: ui.largePadding,
                    bottom: ui.extraLargePadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/logo.png",
                      width: 50,
                      height: 50,
                    ),
                    Text(
                      languages.getText("logo"),
                      style: ui.bigTitleTextStyle
                          ?.copyWith(color: ui.hintColor),
                    ),
                  ],
                ),
              ),
              //account button
              DrawerItem(
                itemText: languages.getText("account"),
                itemIcon: "assets/drawer/account.png",
                itemOnClick: (){},
              ),
              DrawerItem(
                itemText: languages.getText("cart"),
                itemIcon: "assets/drawer/cart.png",
                itemOnClick: (){},
              ),
              DrawerItem(
                itemText: languages.getText("myRequests"),
                itemIcon: "assets/drawer/products.png",
                itemOnClick: (){},

              ),
              DrawerItem(
                itemText: languages.getText("aboutUs"),
                itemIcon: "assets/drawer/info.png",
                itemOnClick: (){},

              ),
              DrawerItem(
                itemText: languages.getText("exit"),
                itemIcon: "assets/drawer/logout.png",
                itemOnClick: exitAction,
              ),
              SizedBox(
                height: ui.extraLargePadding,
              ),
              Container(
                padding:
                EdgeInsets.only(left: ui.largePadding, right: ui.largePadding, top: ui.normalPadding, bottom: ui.smallPadding),
                child: Text(
                  languages.getText("followUs"),
                  style: ui.normalTextStyle
                      ?.copyWith(color: ui.hintColor),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: ui.largePadding, right: ui.largePadding, bottom: ui.normalPadding),
                child: Row(
                  children: [
                    InkWell(
                      onTap: instagramAction,
                      child: Image.asset(
                        "assets/drawer/instagram.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                    SizedBox(
                      width: ui.largePadding,
                    ),
                    InkWell(
                        onTap: facebookAction,
                        child: Image.asset(
                          "assets/drawer/facebook.png",
                          width: 20,
                          height: 20,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  exitAction() {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  instagramAction() {
    launch("https://www.instagram.com/mallofiraq/");
  }

  facebookAction() {
    launch("https://www.facebook.com/MallOfIraq/");
  }
}

