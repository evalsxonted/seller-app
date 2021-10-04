import 'package:flutter/material.dart';
import 'package:seller/apis/request.dart';
import 'package:seller/db/hive_prefs.dart';
import 'package:seller/models/request.dart';
import 'package:seller/pages/cart/cart_c.dart';
import 'package:seller/pages/start/material_app_props_controller.dart';
import 'package:seller/widgets/home_wrapper.dart';
import 'package:seller/widgets/overlay_c.dart';
import 'package:seller/widgets/snackbar_text.dart';

class BuyingController {
  List<String> englishProvinces = [
    "Erbil",
    "Anbar",
    "Babylon",
    "Baghdad",
    "Basra",
    "Halabja",
    "Duhok",
    "Qadisiyyah",
    "Diyala",
    "Dhi Qar",
    "Sulaymaniyah",
    "Saladin",
    "Kirkuk",
    "Karbala",
    "Muthanna",
    "Maysan",
    "Najaf",
    "Nineveh",
    "Wasit"
  ];
  List<String> arabicProvinces = [
    "أربيل",
    "الأنبار",
    "بابل",
    "بغداد",
    "البصرة",
    "حلبجة",
    "دهوك",
    "القادسية",
    "ديالى",
    "ذي قار",
    "السليمانية",
    "صلاح الدين",
    "كركوك",
    "كربلاء",
    "المثنى",
    "ميسان",
    "النجف",
    "نينوى",
    "واسط",
  ];
  double capitalDeliveryPrice = 5;
  double provinceDeliveryPrice = 10;
  MyOverlayController buyingOverlay = MyOverlayController();
  TextEditingController cLocation = TextEditingController();
  TextEditingController cPhone = TextEditingController();
  TextEditingController cName = TextEditingController();
  BuildContext context;
  RequestInfo requestInfo = RequestInfo(selectedProducts: [], userPhone: HivePrefs.singleton?.getUserPhone);
  final CartController cartController;
  late final ValueNotifier<String> provinceNotifier;

  BuyingController(this.cartController, this.context) {
    cartController.cartProducts.value.forEach((product) {
      if (product.buyingInfo?.checked ?? false) {
        requestInfo.selectedProducts.add(product);
        requestInfo.productsPrice += product.price;
      }
    });
    requestInfo.deliveryPrice = provinceDeliveryPrice;
    requestInfo.totalPrice =
        requestInfo.deliveryPrice + requestInfo.productsPrice;
    requestInfo.province = PropsHandler.singleton.getLocale.languageCode == "en"
        ? englishProvinces[0]
        : arabicProvinces[0];
    provinceNotifier = ValueNotifier(requestInfo.province!);
  }

  changeProvince(newProvince) {
    requestInfo.deliveryPrice =
        (newProvince == "بغداد" || newProvince == "Baghdad")
            ? capitalDeliveryPrice
            : provinceDeliveryPrice;
    requestInfo.province = newProvince;
    requestInfo.totalPrice =
        requestInfo.deliveryPrice + requestInfo.productsPrice;
    provinceNotifier.value = newProvince;

  }

  buyAll() async {
    buyingOverlay.setActive = true;
    requestInfo.receiverName = cName.text.trim();
    requestInfo.receiverPhone = cPhone.text.trim();
    requestInfo.location = cLocation.text.trim();
    requestInfo.requestTime= DateTime.now();
    RequestAPI().addRequest(requestInfo).then((value) {
      Navigator.of(context).pop();
      showSnackBar("requestedSuccessfully");
    });
    buyingOverlay.setActive = false;

  }
  void showSnackBar(String messageCode){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: MySnackBarContent(
          snackText:
          HomeInherited.of(context)!.languages.getText(messageCode),
        ),
        backgroundColor: HomeInherited.of(context)!.ui.highlightColor,
      ),
    );
  }
}
