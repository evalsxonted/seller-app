import 'dart:convert';

import 'package:seller/models/product.dart';

class RequestInfo {
  int? userPhone;
  String? province;
  String? location;
  String? receiverName;
  String? receiverPhone;
  double deliveryPrice;
  double productsPrice;
  double totalPrice;
  List<ProductInfo> selectedProducts;
  DateTime? requestTime;

  RequestInfo(
      {required this.userPhone,
      this.province,
      this.location,
      this.receiverName,
      this.receiverPhone,
      required this.selectedProducts,
      this.requestTime,
      this.deliveryPrice = 0,
      this.productsPrice = 0,
      this.totalPrice = 0});

  static RequestInfo fromMap(Map info) {
    return RequestInfo(
      userPhone: info["userPhone"],
      selectedProducts: ProductInfo.fromMapList(info["selectedProducts"]),
      province: info["province"],
      location: info["location"],
      deliveryPrice: info["deliveryPrice"],
      productsPrice: info["productsPrice"],
      receiverName: info["receiverName"],
      receiverPhone: info["receiverPhone"],
      requestTime: info["requestTime"],
      totalPrice: info["totalPrice"],
    );
  }
  static List<RequestInfo> fromJsonList(String jsonList) {
    List requestsList = jsonDecode(jsonList);
    return List.generate(requestsList.length, (index) => fromMap(requestsList[index]));
  }
}
