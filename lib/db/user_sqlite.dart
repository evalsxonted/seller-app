import 'dart:async';

import 'package:seller/models/user.dart';
import 'package:sqflite/sqflite.dart';

class UserDB {
  final Database db;
  UserDB(this.db);

  Future<bool> addUser(User user) async{
    return await db.insert(
      'users',
      user.toSqlMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    ) != 0;
  }
}