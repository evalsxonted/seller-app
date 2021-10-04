import 'dart:async';

import 'package:seller/models/product.dart';
import 'package:sqflite/sqflite.dart';

class CartDB {
  final Database db;
  CartDB(this.db);

  Future<bool> addToCart(ProductInfo productInfo) async{
    return await db.insert(
      'cart',
      productInfo.toSqlMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    ) != 0;
  }
  Future<List<ProductInfo>> getAllCart() async{
    final List<Map<String, dynamic>> maps = await db.query('cart');
    return List.generate(maps.length, (index) {
      return ProductInfo.fromSqlMap(maps[index]);
    });
  }
}