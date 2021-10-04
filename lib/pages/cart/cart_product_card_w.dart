import 'package:flutter/material.dart';
import 'package:seller/models/buying_info.dart';
import 'package:seller/utilities/langauges.dart';
import 'package:seller/utilities/ui_helper.dart';
import 'package:seller/widgets/home_wrapper.dart';
import 'cart_product_card_c.dart';
import 'details_input.dart';

class CartProduct extends StatelessWidget {
  final CartProductController cartProductController;
  const CartProduct(this.cartProductController) ;

  @override
  Widget build(BuildContext context) {
    HelperUI ui = HomeInherited.of(context)!.ui;
    Languages languages = HomeInherited.of(context)!.languages;
    return Container(
      height: 240,
      width: ui.maxWidth - ui.extraLargePadding,
      decoration: BoxDecoration(
        color: ui.cardColor,
        borderRadius: BorderRadius.all(Radius.circular(ui.largePadding)),
      ),
      margin: EdgeInsets.only(left: ui.normalPadding, right: ui.normalPadding),
      padding: EdgeInsets.all(ui.smallPadding),
      child: ValueListenableBuilder(
        valueListenable: cartProductController.buyingInfoNotifier,
        builder: (context, ProductBuyingInfo buyingInfo, __) {
          return Row(
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      cartProductController.productInfo.images[0],
                      width: 150,
                      height: 200,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(
                    height: ui.smallPadding,
                  ),
                  Text(
                      (cartProductController.productInfo.price *
                                  buyingInfo.counter)
                              .toString() +
                          " " +
                          languages.getText("IQD"),
                      style: ui.normalTextStyle?.copyWith(height: 1.2)),
                ],
              ),
              Expanded(
                  child: Column(
                children: [
                  CartDetailsInput(
                    hintText: buyingInfo.selectedImages.length == 0
                        ? languages.getText("color")
                        : languages.getText("colorChosen"),
                    onClickAction: cartProductController.openColorDialog,
                  ),
                  CartDetailsInput(
                    hintText: buyingInfo.selectedSizes.length == 0
                        ? languages.getText("size")
                        : buyingInfo.selectedSizes.toString(),
                    onClickAction: cartProductController.openSizeDialog,
                  ),
                  CartDetailsInput(
                    hintText: languages.getText("otherDetails"),
                    onClickAction: cartProductController.openDetailsDialog,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: ui.normalPadding,
                        right: ui.normalPadding,
                        bottom: ui.normalPadding),
                    height: 40,
                    width: ui.maxWidth,
                    decoration: BoxDecoration(
                      color: ui.textFieldBgColor,
                      borderRadius:
                          BorderRadius.all(Radius.circular(ui.smallPadding)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            icon: Icon(Icons.add, color: ui.iconColor),
                            onPressed: () =>
                                cartProductController.changeCount(true)),
                        Text(buyingInfo.counter.toString(),
                            style: ui.smallTextStyle
                                ?.copyWith(color: ui.highlightColor)),
                        IconButton(
                            icon: Icon(Icons.remove, color: ui.iconColor),
                            onPressed: () =>
                                cartProductController.changeCount(false)),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: ui.normalPadding, right: ui.normalPadding),
                    height: 30,
                    width: ui.maxWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            cartProductController.cartController.deleteFromCart(cartProductController.productIndex);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: ui.smallPadding),
                            child: Icon(
                              Icons.delete,
                              color: ui.highlightColor,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: cartProductController.selectProduct,
                          child: Row(
                            children: [
                              Text(
                                languages.getText("select"),
                                style: ui.smallTextStyle,
                              ),
                              Icon(
                                buyingInfo.checked
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank,
                                color: ui.hintColor,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ))
            ],
          );
        },
      ),
    );
  }
}
