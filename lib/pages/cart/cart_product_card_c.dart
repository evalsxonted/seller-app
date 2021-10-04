import 'package:flutter/material.dart';
import 'package:seller/models/buying_info.dart';
import 'package:seller/models/product.dart';
import 'package:seller/pages/cart/cart_c.dart';
import 'package:seller/pages/cart/product_size_dialog.dart';
import 'package:seller/widgets/home_wrapper.dart';

import 'product_color_dialog.dart';
import 'product_details_dialog.dart';

class CartProductController {
  late final TextEditingController detailsController;
  final int productIndex;
  late final ProductInfo productInfo;
  final CartController cartController;
  late final ValueNotifier<ProductBuyingInfo> buyingInfoNotifier;
  final BuildContext context;

  CartProductController(this.productIndex, this.cartController, this.context) {
    detailsController = new TextEditingController();
    productInfo = cartController.cartProducts.value[productIndex];
    ProductBuyingInfo buyingInfo = productInfo.buyingInfo ??
        ProductBuyingInfo(
            counter: 1,
            checked: false,
            selectedSizes: [],
            selectedImages: [],
            details: "");
    buyingInfoNotifier = ValueNotifier<ProductBuyingInfo>(buyingInfo);
    buyingInfoNotifier.addListener(() {
      cartController.cartProducts.value[productIndex].buyingInfo = buyingInfoNotifier.value;
    });
  }

  selectProduct() {
    buyingInfoNotifier.value.checked = !buyingInfoNotifier.value.checked;
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    buyingInfoNotifier.notifyListeners();
  }

  changeCount(bool increment) {
    if (increment) {
      buyingInfoNotifier.value.counter += 1;
      // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
      buyingInfoNotifier.notifyListeners();
    } else {
      if (buyingInfoNotifier.value.counter != 1) {
        buyingInfoNotifier.value.counter -= 1;
        // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
        buyingInfoNotifier.notifyListeners();
      }
    }
  }

  updateBuyingInfo() {
    cartController.cartProducts.value[productIndex].buyingInfo =
        productInfo.buyingInfo;
  }

  Future<void> openColorDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return HomeWrapper(
          child: ColorPick(
            images: productInfo.images,
            setColorCallBack: (List<String> images) {
              buyingInfoNotifier.value.selectedImages = images;
              // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
              buyingInfoNotifier.notifyListeners();
            },
          ),
        );
      },
    );
  }

  Future<void> openSizeDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return HomeWrapper(
          child: SizePick(
            sizes: productInfo.divisions,
            sizesChangeFunction: (List<String> sizes) {
              buyingInfoNotifier.value.selectedSizes = sizes;
              // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
              buyingInfoNotifier.notifyListeners();
            },
          ),
        );
      },
    );
  }

  Future<void> openDetailsDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return DetailsPick(detailsChangeFunction: (String details) {
          buyingInfoNotifier.value.details = details;
          // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
          buyingInfoNotifier.notifyListeners();
        });
      },
    );
  }
}
