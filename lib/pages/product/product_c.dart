import 'package:flutter/material.dart';
import 'package:seller/db/cart_sqlite.dart';
import 'package:seller/db/db_init/sqlite_db_init.dart';
import 'package:seller/models/product.dart';
import 'package:sqflite/sqflite.dart';

class ProductController{
  ValueNotifier<int> chosenImageNotifier = ValueNotifier<int>(0);
  ValueNotifier<bool> addedToCartNotifier = ValueNotifier<bool>(false);
  final ProductInfo productInfo;
  final BuildContext context;
  ProductController(this.context, this.productInfo);



  addToCart() async {
    if(!addedToCartNotifier.value){
      Database database = await Sqlite().initDatabase();
      bool added = await CartDB(database).addToCart(productInfo);
      if(added){
        addedToCartNotifier.value = true;
        database.close();
      }
    }else{
      Navigator.of(context).pushNamed("/cart");
    }
  }

  goToSupport() =>
    Navigator.of(context).pushNamed("/customerServices");

}