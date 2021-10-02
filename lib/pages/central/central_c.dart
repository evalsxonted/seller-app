import 'package:flutter/material.dart';
import 'package:seller/apis/product.dart';
import 'package:seller/models/category.dart';
import 'package:seller/models/product.dart';

class CentralController {
  ScrollController listController = ScrollController();
  ValueNotifier<List<ProductInfo>> productsSourceNotifier = ValueNotifier([]);
  List<CategoryInfo>? categories;

  CentralController() {
    listController.addListener(_scrollListener);
    _initCentralPage();
  }

  _scrollListener() async {
    if (listController.offset >= listController.position.maxScrollExtent &&
        !listController.position.outOfRange) {
      productsSourceNotifier.value += await ProductAPI().getMoreProducts(
              categories![0].name,
              categories![0].subCategories[0],
              productsSourceNotifier.value.length) ??
          [];
    }
  }

  _initCentralPage() async {
    categories = await ProductAPI().getCategories();
    productsSourceNotifier.value = await ProductAPI()
            .getProducts(categories![0].name, categories![0].subCategories[0]) ??
        [];
  }
}
