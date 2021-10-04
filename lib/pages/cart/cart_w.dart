import 'package:flutter/material.dart';
import 'package:seller/models/product.dart';
import 'package:seller/pages/cart/cart_product_card_c.dart';
import 'package:seller/utilities/langauges.dart';
import 'package:seller/widgets/appbar_global.dart';
import 'package:seller/widgets/button_main.dart';
import 'package:seller/widgets/home_wrapper.dart';

import 'cart_c.dart';
import 'cart_product_card_w.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  late final CartController cartController;

  @override
  void initState() {
    cartController = CartController(context);
    super.initState();
  }
  @override
  void dispose() {
    cartController.cartProducts.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Languages languages = HomeInherited.of(context)!.languages;
    return Scaffold(
      appBar: AppBarGlobal(
        title: languages.getText("cart"),
      ),
      body:  Directionality(
        textDirection: TextDirection.ltr,
        child: ValueListenableBuilder(valueListenable: cartController.cartProducts,
          builder: (context,List<ProductInfo> productsList, child) {
          if(productsList.isEmpty){
            return Center(child: Text(languages.getText("emptyCart")));
          }else{
            return SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                      child: ListView.builder(
                        itemCount: productsList.length,
                        itemBuilder: (context, index) {

                          return Padding(
                            padding: EdgeInsets.only(top: 20, bottom: 10),
                            child: CartProduct(CartProductController(
                              index,
                              cartController,
                              context
                            )),
                          );
                        },
                      )),
                  Container(
                    margin: EdgeInsets.all(15),
                    child: MainButton(
                      buttonText: languages.getText("buySelected"),
                      buttonType: ButtonType.accent,
                      buttonFunction: cartController.buySelectedAction,
                    ),
                  ),
                ],
              ),
            );
          }
        },)
      ),
    );
  }
}

