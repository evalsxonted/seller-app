import 'package:flutter/material.dart';
import 'package:seller/db/cart_sqlite.dart';
import 'package:seller/db/db_init/sqlite_db_init.dart';
import 'package:seller/models/product.dart';
import 'package:seller/pages/buying/buying_w.dart';
import 'package:seller/widgets/home_wrapper.dart';
import 'package:sqflite/sqflite.dart';

class CartController {
  final BuildContext context;
  ValueNotifier<List<ProductInfo>> cartProducts =
      ValueNotifier<List<ProductInfo>>([]);

  CartController(this.context) {
    initCart();
  }

  initCart() async {
    Database database = await Sqlite().initDatabase();
    cartProducts.value = await CartDB(database).getAllCart();
    database.close();
  }

  buySelectedAction() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            HomeWrapper(child: Buying(cartController: this))));
  }

  deleteFromCart(int productIndex) async {
    cartProducts.value.removeAt(productIndex);
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    cartProducts.notifyListeners();
  }
}
