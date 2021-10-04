import 'package:flutter/material.dart';
import 'package:seller/pages/buying/buying_c.dart';
import 'package:seller/pages/cart/cart_c.dart';
import 'package:seller/utilities/langauges.dart';
import 'package:seller/utilities/ui_helper.dart';
import 'package:seller/widgets/appbar_global.dart';
import 'package:seller/widgets/button_main.dart';
import 'package:seller/widgets/dropdown.dart';
import 'package:seller/widgets/home_wrapper.dart';
import 'package:seller/widgets/input.dart';
import 'package:seller/widgets/overlay_w.dart';

import 'buying_price.dart';
import 'input_margin.dart';

class Buying extends StatefulWidget {
  final CartController cartController;
  const Buying({Key? key, required this.cartController}) : super(key: key);

  @override
  _BuyingState createState() => _BuyingState();
}

class _BuyingState extends State<Buying> {
  late final BuyingController buyingController;

  @override
  void initState() {
    buyingController = BuyingController(widget.cartController, context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HelperUI ui = HomeInherited.of(context)!.ui;
    Languages languages = HomeInherited.of(context)!.languages;
    return MyOverlay(
      overlayController: buyingController.buyingOverlay,
      overlayChild: Scaffold(
          backgroundColor: ui.bgColor,
          appBar: AppBarGlobal(
            title: languages.getText("deliveryInfo"),
          ),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                  child: ValueListenableBuilder(valueListenable: buyingController.provinceNotifier,
                    builder: (context,String province, child) {
                    return ListView(
                      children: [
                        InputMargin(
                          padding: ui.largePadding,
                          child: CustomInput(
                            editingController: buyingController.cName,
                            hintText: languages.getText("receiverName"),
                            inputIcon: Image.asset(
                              "assets/person.png",
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ),
                        InputMargin(
                          padding: ui.largePadding,
                          child: CustomInput(
                            editingController: buyingController.cName,
                            hintText: languages.getText("receiverPhone"),
                            inputIcon: Image.asset(
                              "assets/phone.png",
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ),
                        InputMargin(
                          padding: ui.largePadding,
                          child: CustomDropDown(
                            selectedItem: province,
                            items: ui.currentDirection == TextDirection.ltr? buyingController.englishProvinces : buyingController.arabicProvinces,
                            hint: languages.getText("province"),
                            onChange: buyingController.changeProvince,
                          ),
                        ),
                        InputMargin(
                          padding: ui.largePadding,
                          child: CustomInput(
                            editingController: buyingController.cLocation,
                            hintText: languages.getText("location"),
                            inputIcon: Image.asset(
                              "assets/icons/location2.png",
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ),
                        BuyingPrice(
                          pricePrice: languages.getText("deliveryPrice"),
                          priceText: buyingController.requestInfo.deliveryPrice
                              .toString() +
                              " " +
                              languages.getText("IQD"),
                        ),
                        BuyingPrice(
                          pricePrice: languages.getText("productsPrice"),
                          priceText: buyingController.requestInfo.productsPrice
                              .toString() +
                              " " +
                              languages.getText("IQD"),
                        ),
                        BuyingPrice(
                          pricePrice: languages.getText("totalPrice"),
                          priceText: buyingController.requestInfo.totalPrice
                              .toString() +
                              " " +
                              languages.getText("IQD"),
                        ),
                      ],
                    );
                  },)),

              Container(
                margin: EdgeInsets.all(15),
                child: MainButton(
                  buttonText: languages.getText("confirmBuying"),
                  buttonFunction: buyingController.buyAll,
                  buttonType: ButtonType.accent,
                ),
              ),
            ],
          )),
    );
  }
}
