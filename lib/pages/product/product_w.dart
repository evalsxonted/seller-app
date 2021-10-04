import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seller/models/product.dart';
import 'package:seller/pages/product/product_images.dart';
import 'package:seller/utilities/langauges.dart';
import 'package:seller/utilities/ui_helper.dart';
import 'package:seller/widgets/appbar_global.dart';
import 'package:seller/widgets/button_main.dart';
import 'package:seller/widgets/home_wrapper.dart';

import 'product_c.dart';

class Product extends StatefulWidget {
  final ProductInfo productInfo;

  const Product({Key? key, required this.productInfo}) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  late final ProductController productController;

  @override
  void initState() {
    productController = ProductController(context, widget.productInfo);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HelperUI ui = HomeInherited.of(context)!.ui;
    Languages languages = HomeInherited.of(context)!.languages;
    return Scaffold(
      backgroundColor: ui.bgColor,
      appBar: AppBarGlobal(
        title: productController.productInfo.title,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(ui.smallPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProductImages(productController: productController),
            Container(
              margin: EdgeInsets.only(left: ui.normalPadding, right: ui.normalPadding),
              child: Text(
                productController.productInfo.brand,
                style: ui.titleTextStyle,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: ui.normalPadding, right: ui.normalPadding),
              child: Text(productController.productInfo.desc,
                  style: ui.bigTextStyle),
            ),
            productController.productInfo.divisions.isEmpty
                ? Container()
                : Container(
                    margin: EdgeInsets.only(left: ui.normalPadding, right: ui.normalPadding),
                    child: Text(
                      languages.getText("sizes"),
                      style: ui.titleTextStyle,
                    ),
                  ),
            productController.productInfo.divisions.isEmpty
                ? Container()
                : Container(
                    margin: EdgeInsets.only(left: ui.normalPadding, right: ui.normalPadding),
                    child: Text(
                      productController.productInfo.divisions.join(" - "),
                      style: ui.bigTextStyle
                          ?.copyWith(height: 1.4),
                    ),
                  ),
            Container(
              margin: EdgeInsets.only(left: ui.normalPadding, right: ui.normalPadding),
              child: Container(
                  padding: EdgeInsets.only(left: ui.smallPadding),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left:  ui.smallPadding, top:  ui.smallPadding),
                        child: Text(
                            productController.productInfo.price.toString() + " IQD",
                            style: ui.smallTextStyle),
                      ),
                      productController.productInfo.oldPrice != null
                          ? Padding(
                          padding:  EdgeInsets.only(left: ui.normalPadding),
                          child: Text(productController.productInfo.oldPrice.toString() + " IQD",
                              style: ui.discountedTextStyle))
                          : SizedBox(),
                    ],
                  )),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: ui.normalPadding,
                  right: ui.normalPadding,
                  top: ui.extraLargePadding,
                  bottom: ui.largePadding),
              child: ValueListenableBuilder(valueListenable: productController.addedToCartNotifier,
                builder: (context,bool addedToCart, child) {
                return  MainButton(
                  buttonText: addedToCart
                      ? languages.getText("goToCart")
                      : languages.getText("addToCart"),
                  buttonFunction: productController.addToCart,
                  buttonType: ButtonType.accent,
                );
              },)
            ),
            Container(
              width: ui.maxWidth,
              margin: EdgeInsets.only(bottom: ui.largePadding),
              alignment: Alignment.center,
              child: InkWell(
                onTap: productController.goToSupport,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      languages.getText("youHaveQuestion"),
                      style: ui.normalTextStyle
                          ?.copyWith(color: ui.hintColor),
                    ),
                    SizedBox(width: ui.smallPadding,),
                    Text(
                      languages.getText("talkToUs"),
                      style: ui.highlightTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
